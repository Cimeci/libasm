NAME		= libasm.a
EXEC		= exec

NASM		= nasm
NASMFLAGS	= -f elf64
AR			= ar rcs
RM			= rm -rf

SRC_DIR		= manda
OBJ_DIR		= obj

SRC_FILES	= ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s

SRCS		= $(addprefix $(SRC_DIR)/, $(SRC_FILES))
OBJS		= $(addprefix $(OBJ_DIR)/, $(SRC_FILES:.s=.o))

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	@mkdir -p $(OBJ_DIR)
	$(NASM) $(NASMFLAGS) $< -o $@

all: $(NAME)

$(NAME): $(OBJS)
	$(AR) $(NAME) $(OBJS)

clean:
	$(RM) $(OBJ_DIR)

fclean: clean
	$(RM) $(NAME) $(EXEC)

re: fclean all

use:
	cc -Wall -Werror -Wextra main.c $(NAME) -o $(EXEC)

.PHONY: all clean fclean re use
