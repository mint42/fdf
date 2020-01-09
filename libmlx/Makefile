# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rreedy <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/09 05:47:53 by rreedy            #+#    #+#              #
#    Updated: 2020/01/09 06:16:56 by rreedy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

include config.mk

SRCS := $(foreach src_dir, $(SRC_DIRS), $(wildcard $(src_dir)/*.c))
SRCS += $(foreach src_dir, $(SRC_DIRS), $(wildcard $(src_dir)/*.m))
OBJS := $(patsubst %.c,%.o,$(SRCS))

.PHONY: all clean fclean re start stop

all: $(NAME)

$(NAME): start $(OBJS) Makefile config.mk stop
	@ ar rc $(NAME) $(OBJS)
	@ ranlib $(NAME)

start:
	@ printf "$(COMPILE_COLOR)Compiling MiniLibX srcs $(DOTS_COLOR)"

%.o: %.c
	@ $(CC) $(CFLAGS) -c $< -o $@
	@ printf "."

#	%.o: %.m
#		@ $(CC) $(CFLAGS) -c $< -o $@
#		@ printf "."

stop:
	@ printf "$(FINISH_COLOR) done$(CLEAR_COLOR)\n"

clean:
	@ if $(foreach obj, $(OBJS),[ -f $(obj) ] ||) false; then \
		printf "$(DELETE_COLOR)Cleaning $(NAME_COLOR)$(NAME)$(CLEAR_COLOR)\n"; \
	  fi; 
	@- $(RM) -f $(OBJS)
	@- $(RM) -f mlx_app

fclean: clean
	@- if [ -f $(NAME) ]; then \
			$(RM) $(NAME); \
			printf "$(DELETE_COLOR)Removing $(NAME_COLOR)$(NAME)\n"; \
	   fi;

re: fclean all
