NAME = libasm.a

ASM = nasm
ASMFLAGS = -f elf64
LD = LD
LDFLAGS =

SRC = ft_strlen.s
OBJ = $(SRC:.s=.o)

all:$(NAME)

$(NAME): $(OBJ)
	$(LD) $(LDFLAGS) -o $@ $^

%.o: %.s
	$(ASM) $(ASMFLAGS) $< -o $@

clean:
	rm -rf $

fclean: clean