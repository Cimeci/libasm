global	ft_strlen
section	.text

ft_strlen:

	xor rax, rax;
.loop:
	cmp byte [rdi + rax], 0;
	je	.end;
	inc	rax;
	jmp	.loop;
.end:
	ret


ft_strlen:
	mov		rax, rdi
	jmp		.loop
.inc:
	inc		rax
.loop:
	movzx	edx, byte [rax]
	test	al, al
	jne		.inc
	sub		rax, rdi
	ret
