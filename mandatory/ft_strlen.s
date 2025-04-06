global ft_strlen
section .text

ft_strlen:
		xor		rax, rax          ; rax = 0 → notre compteur (i)
	.loop:
		cmp		byte [rdi + rax], 0  ; on lit str[i] et on compare à 0
		je		.done                 ; si c’est 0 (fin de chaîne), on sort
		inc		rax                   ; sinon on compte +1
		jmp		.loop
	.done:
		ret