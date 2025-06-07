NAME		= libasm.a
EXEC		= exec

NASM		= nasm
NASMFLAGS	= -f elf64
AR			= ar rcs
RM			= rm -f

SRCS		= manda/ft_strlen.s\
				manda/ft_strcpy.s\
				manda/ft_strcmp.s\
				manda/ft_write.s\
				manda/ft_read.s\
				manda/ft_strdup.s\



OBJS		= $(SRCS:.s=.o)

%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

all: $(NAME)

$(NAME): $(OBJS)
	$(AR) $(NAME) $(OBJS)

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME) $(exec)

re: fclean all

use:
	cc main.c $(NAME) -o $(EXEC)

.PHONY: all clean fclean re use
