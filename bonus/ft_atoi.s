global ft_atoi
section .text

ft_atoi:
	xor		rax, rax
	xor		rcx, rcx

.loop:
	mov		bl, [rdi + rcx]
	test	bl, bl
	je		.end

    sub		bl, '0'
    cmp		bl, 9
    ja		.end

	imul 	rax, rax, 10
	movzx   r8, bl
	add		rax, r8

	inc rcx
	jmp .loop

.end:
	ret