NAME = main_exec
LIB = libasm.a

ASM = nasm
ASMFLAGS = -f elf64
AR = ar
ARFLAGS = rcs

SRC = ft_strlen.s
OBJ_DIR = .obj
OBJ = $(addprefix $(OBJ_DIR)/, $(SRC:.s=.o))

MAIN = main.s
MAIN_OBJ = $(OBJ_DIR)/main.o

all: $(NAME)

# Création de la librairie
$(LIB): $(OBJ)
	$(AR) $(ARFLAGS) $@ $^

# Compilation du main
$(MAIN_OBJ): $(MAIN)
	@mkdir -p $(OBJ_DIR)
	$(ASM) $(ASMFLAGS) $< -o $@

# Link final
$(NAME): $(LIB) $(MAIN_OBJ)
	ld -o $@ $(MAIN_OBJ) $(LIB)

# Compilation des .s → .o
$(OBJ_DIR)/%.o: %.s
	@mkdir -p $(OBJ_DIR)
	$(ASM) $(ASMFLAGS) $< -o $@

clean:
	@rm -rf $(OBJ_DIR)

fclean: clean
	@rm -rf $(NAME) $(LIB)

re: fclean all

.PHONY: all clean fclean re
