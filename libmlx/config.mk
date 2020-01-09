# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    config.mk                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rreedy <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/09 05:54:46 by rreedy            #+#    #+#              #
#    Updated: 2020/01/09 06:15:06 by rreedy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME := libmlx.a

CC := gcc
INCLUDES := -I./
CFLAGS += -Wall -Wextra -Werror $(INCLUDES)
LDFLAGS += -L./ -lft

NAME_COLOR := \e[1;33m
COMPILE_COLOR := \e[1;32m
DOTS_COLOR := \e[0;36m
FINISH_COLOR := \e[0;32m
CLEAR_COLOR := \e[m
DELETE_COLOR := \e[0;31m
