global ft_strcpy
section .text

ft_strcpy:
	mov		rcx, 0
.loop:
	mov		al, [rsi + rcx]
	mov		[rdi + rcx], al
	inc		rcx
	test	al, al
	je		.end
	jne		.loop
.end:
    mov		rax, rdi
    ret
