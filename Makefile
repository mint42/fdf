# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rreedy <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/07/13 11:34:50 by rreedy            #+#    #+#              #
#    Updated: 2019/07/13 12:23:51 by rreedy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FDF := fdf
LIB := lib/libft.a
MLX := mlx/libmlx.a

FDF_OBJS := $(patsubst %.c,%.o,$(wildcard ./srcs/*.c))

CC := gcc
INCLUDES := -I./includes -I./lib/includes -I./lib/includes/ft_printf -I./mlx
CFLAGS += -g -Wall -Wextra -Werror $(INCLUDES)
LFLAGS += -L./lib -lft -L./mlx -lmlx

.PHONY: all clean fclean re name

all: name

name: $(FDF)

$(FDF): $(MLX) $(LIB) $(FDF_OBJS)
	$(CC) $(CFLAGS) $(FDF_OBJS) -o $(FDF) $(LFLAGS) -framework OpenGL -framework Appkit

$(LIB):
	@- make -C lib/ all

$(MLX):
	@- make -C mlx/ all

clean:
	@- $(RM) $(FDF_OBJS)
	@- make -C lib/ clean
	@- make -C mlx/ clean

fclean: clean
	@- $(RM) $(FDF)
	@- make -C lib/ fclean

re: fclean all
