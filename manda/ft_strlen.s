global	ft_strlen
section	.text

ft_strlen:
	mov	rax, -1
.loop:
	lea rax, [rax + 1]
	cmp	byte [rdi + rax], 0
	jne	.loop
.end:
	ret