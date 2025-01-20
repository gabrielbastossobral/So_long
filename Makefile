# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gabastos <gabastos@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/17 11:48:30 by gabrielsobr       #+#    #+#              #
#    Updated: 2025/01/20 08:36:49 by gabastos         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			= so_long

GREEN			= \033[0;32m
RED				= \033[0;31m
RESET			= \033[0m

LIBFT			= ./libft/libft.a

CC 				= cc

STANDARD_FLAGS 	= -Wall -Werror -Wextra
MINILIBX_FLAGS	= -lmlx -lXext -lX11

REMOVE 			= rm -f

SRCS_DIR		= ./sources/

SRCS 			= $(addprefix $(SRCS_DIR),\
				so_long.c			\
				ft_check_map.c		\
				ft_close_game.c		\
				ft_free_memory.c	\
				ft_handle_input.c	\
				ft_init_game.c		\
				ft_init_map.c		\
				ft_render_map.c		\
				ft_utils.c)

OBJS			= $(SRCS:.c=.o)

all:			${LIBFT} ${NAME}

${LIBFT}:
				@make -C libft
				@echo

${NAME}:		${OBJS}
				${CC} ${OBJS} ${LIBFT} ${STANDARD_FLAGS} ${MINILIBX_FLAGS} -o ${NAME}
				@echo "$(NAME): $(GREEN)$(NAME) was compiled.$(RESET)"
				@echo

${SRCS_DIR}%.o: ${SRCS_DIR}%.c
				${CC} ${STANDARD_FLAGS} -c $< -o $@

clean:
				make clean -C libft
				${REMOVE} ${OBJS}
				@echo

fclean:			clean
				${REMOVE} ${NAME} ${LIBFT}
				@echo "${NAME}: ${RED}${NAME} was deleted${RESET}"
				@echo

re:				fclean all

.PHONY:			all clean fclean re valgrind