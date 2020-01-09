# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rreedy <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/07/13 11:34:50 by rreedy            #+#    #+#              #
#    Updated: 2020/01/09 05:52:30 by rreedy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

include config.mk 

SRCS := $(foreach src_dir, $(SRC_DIRS), $(wildcard $(src_dir)/*.c))
OBJS := $(patsubst %.c,%.o,$(SRCS))
DEPS := $(patsubst %.c,%.d,$(SRCS))

LIBFT := $(LIBFT_DIR)/$(LIBFT_NAME)
MAKE_LIBFT := make -C $(LIBFT_DIR) -f $(LIBFT_MAKEFILE) --no-print-directory

LIBMLX := $(LIBMLX_DIR)/$(LIBMLX_NAME)
MAKE_LIBMLX := make -C $(LIBMLX_DIR) -f $(LIBMLX_MAKEFILE) --no-print-directory

.PHONY: all clean fclean re name

all: $(NAME)

$(NAME): $(LIBMLX) $(LIBFT) $(OBJS) Makefile config.mk
	$(CC) $(CFLAGS) $(OBJS) -o $(NAME) $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -MMD -MT $@ -c $< -o $@

-include $(DEPS)

$(LIBMLX):
	@- $(MAKE_LIBMLX) all

$(LIBFT):
	@- $(MAKE_LIBFT) all

clean:
	@- $(RM) $(OBJS)
	@- $(MAKE_LIBMLX) clean
	@- $(MAKE_LIBFT) clean

fclean: clean
	@- $(RM) $(NAME)
	@- $(MAKE_LIBFT) fclean

re: fclean all
