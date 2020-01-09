# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    config.mk                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rreedy <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/10/22 09:39:36 by rreedy            #+#    #+#              #
#    Updated: 2020/01/09 05:52:19 by rreedy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME := fdf

LIBFT_NAME := libft.a
LIBFT_DIR := ./libft
LIBFT_MAKEFILE := Makefile

LIBMLX_NAME := libmlx.a
LIBMLX_DIR := ./libmlx
LIBMLX_MAKEFILE := Makefile

LIBS := ft
LIBS += mlx
LOCAL_LIB_DIRS := $(LIBFT_DIR)
LOCAL_LIB_DIRS += $(LIBMLX_DIR)
LIB_INCLUDE_DIRS := $(LIBFT_DIR)/includes
LIB_INCLUDE_DIRS += $(LIBFT_DIR)/includes/ft_printf
LIB_INCLUDE_DIRS += $(LIBMLX_DIR)

SRC_DIRS := ./srcs
SRC_DIRS += ./srcs/events
INCLUDE_DIRS := ./includes

CC := gcc
CFLAGS := -g
CFLAGS += -Wall
CFLAGS += -Wextra
CFLAGS += -Werror
CFLAGS += $(foreach include,$(INCLUDE_DIRS),-I$(include))
CFLAGS += $(foreach lib_include,$(LIB_INCLUDE_DIRS),-I$(lib_include))
LDFLAGS := -framework OpenGL
LDFLAGS += -framework Appkit
LDFLAGS += $(foreach local_lib,$(LOCAL_LIB_DIRS),-L$(local_lib))
LDFLAGS += $(foreach lib,$(LIBS),-l$(lib))
