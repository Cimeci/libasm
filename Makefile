NAME		= libasm.a
EXEC		= exec

NASM		= nasm
NASMFLAGS	= -f elf64
AR			= ar rcs
RM			= rm -rf

MANDATORY_DIR	= manda
BONUS_DIR		= bonus
OBJ_DIR			= obj

MANDATORY_FILES	= ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
BONUS_FILES		= ft_atoi_base.s ft_list_push_front.s ft_list_size.s ft_list_sort.s ft_list_remove_if.s\
				ft_atoi.s
MANDATORY_SRCS	= $(addprefix $(MANDATORY_DIR)/, $(MANDATORY_FILES))
BONUS_SRCS		= $(addprefix $(BONUS_DIR)/, $(BONUS_FILES))

MANDATORY_OBJS	= $(addprefix $(OBJ_DIR)/, $(MANDATORY_FILES:.s=.o))
BONUS_OBJS		= $(addprefix $(OBJ_DIR)/, $(BONUS_FILES:.s=.o))

$(OBJ_DIR)/%.o: $(MANDATORY_DIR)/%.s
	@mkdir -p $(OBJ_DIR)
	$(NASM) $(NASMFLAGS) $< -o $@

$(OBJ_DIR)/%.o: $(BONUS_DIR)/%.s
	@mkdir -p $(OBJ_DIR)
	$(NASM) $(NASMFLAGS) $< -o $@

all: $(NAME)

$(NAME): $(MANDATORY_OBJS)
	$(AR) $(NAME) $(MANDATORY_OBJS)

bonus: $(MANDATORY_OBJS) $(BONUS_OBJS)
	$(AR) $(NAME) $(MANDATORY_OBJS) $(BONUS_OBJS)

clean:
	$(RM) $(OBJ_DIR)

fclean: clean
	$(RM) $(NAME) $(EXEC)

re: fclean all

use:
	cc -Wall -Werror -Wextra main.c $(NAME) -o $(EXEC)

.PHONY: all bonus clean fclean re use