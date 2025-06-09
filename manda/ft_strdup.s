extern		malloc, ft_strlen, ft_strcpy

global		ft_strdup
section		.text

ft_strdup:
	mov		r8, rdi
	call	ft_strlen
	inc		rax
	mov		rdi, rax
	call	malloc
	mov		rdi, rax
	mov		rsi, r8
	call	ft_strcpy
	mov		rax, rdi
	ret