NAME		= libasm.a

EXEC_MANDA	= exec_manda
EXEC_BONUS	= exec_bonus
EXEC_ATOI	= exec_atoi

NASM		= nasm
NASMFLAGS	= -f elf64
AR			= ar rcs
RM			= rm -r

MANDATORY_DIR	= manda
BONUS_DIR		= bonus
ATOI_DIR		= atoi

OBJ_DIR			= obj

MANDATORY_FILES	= ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
BONUS_FILES		= ft_list_push_front.s ft_list_size.s ft_list_sort.s ft_list_remove_if.s ft_atoi_base.s
ATOI_FILES		= ft_atoi.s ft_atoi_sign.s ft_atoi_sign_space.s ft_atoi_check_base.s

MANDATORY_SRCS	= $(addprefix $(MANDATORY_DIR)/, $(MANDATORY_FILES))
BONUS_SRCS		= $(addprefix $(BONUS_DIR)/, $(BONUS_FILES))
ATOI_SRCS		= $(addprefix $(ATOI_DIR)/, $(ATOI_FILES))

MANDATORY_OBJS	= $(addprefix $(OBJ_DIR)/, $(MANDATORY_FILES:.s=.o))
BONUS_OBJS		= $(addprefix $(OBJ_DIR)/, $(BONUS_FILES:.s=.o))
ATOI_OBJS		= $(addprefix $(OBJ_DIR)/, $(ATOI_FILES:.s=.o))

$(OBJ_DIR)/%.o: $(MANDATORY_DIR)/%.s
	@mkdir -p $(OBJ_DIR)
	$(NASM) $(NASMFLAGS) $< -o $@

$(OBJ_DIR)/%.o: $(BONUS_DIR)/%.s
	@mkdir -p $(OBJ_DIR)
	$(NASM) $(NASMFLAGS) $< -o $@

$(OBJ_DIR)/%.o: $(ATOI_DIR)/%.s
	@mkdir -p $(OBJ_DIR)
	$(NASM) $(NASMFLAGS) $< -o $@

all: $(NAME)

$(NAME): $(MANDATORY_OBJS)
	$(AR) $(NAME) $(MANDATORY_OBJS)

bonus: $(MANDATORY_OBJS) $(BONUS_OBJS) $(ATOI_OBJS)
	$(AR) $(NAME) $(MANDATORY_OBJS) $(BONUS_OBJS) $(ATOI_OBJS)

clean:
	$(RM) $(OBJ_DIR)

fclean: clean
	$(RM) $(NAME) $(EXEC_MANDA) $(EXEC_BONUS) $(EXEC_ATOI)

re: fclean all

use:
	cc -Wall -Werror -Wextra main.c $(NAME) -o $(EXEC_MANDA)
	cc -Wall -Werror -Wextra main_bonus.c $(NAME) -o $(EXEC_BONUS)
	cc -Wall -Werror -Wextra main_atoi_base.c $(NAME) -o $(EXEC_ATOI)

.PHONY: all bonus clean fclean re use