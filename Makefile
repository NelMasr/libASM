NAME	= 	libasm.a

SRCS	= 	./srcs/ft_strlen.s \
			./srcs/ft_strcpy.s \
			./srcs/ft_strcmp.s \
			./srcs/ft_write.s \
			./srcs/ft_read.s \
			./srcs/ft_strdup.s \

OBJS	= 	${SRCS:.s=.o}

CC		= 	nasm -felf64

${NAME}:	${OBJS}
			ar rc ${NAME} ${OBJS}
			ranlib ${NAME}

all:		${NAME}

test:
			gcc -Wall -Wextra -Werror main.c libasm.a -o test 

.s.o:
			${CC} -o $@ $?

clean:
			rm -rf ${OBJS}

fclean:		clean
			rm -rf ${NAME}
			rm -rf test

re:			fclean all

.PHONY:		clean	fclean	all	test	re
