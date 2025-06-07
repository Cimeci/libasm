global	ft_strcmp
section	.text

ft_strcmp:
	mov		rax, -1

.loop:
	inc		rax
	movzx	r8, byte [rdi + rax]
	movzx	r9, byte [rsi + rax]
	test	r8b, r8b
	je		.end
	test	r9b, r9b
	je		.end
	cmp		r8b, r9b
	je		.loop

.end:
	sub		r8, r9
	mov		rax, r8
	ret