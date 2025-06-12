global ft_atoi_sign
section .text

ft_atoi_sign:
	xor		rax, rax
	xor		rcx, rcx
	mov		rdx, 1

.main:
	mov		bl, [rdi + rcx]
	cmp		bl, '-'
	jne		.check_plus
	mov		rdx, -1
	inc		rcx
	jmp		.loop

.check_plus:
	cmp		bl, '+'
	jne		.loop
	inc		rcx

.loop:
	mov		bl, [rdi + rcx]
	test	bl, bl
	je		.end

    sub		bl, '0'
    cmp		bl, 9
    ja		.end

	imul 	rax, rax, 10
	movzx   r8d, bl
	add		rax, r8

	inc rcx
	jmp .loop

.end:
	imul	rax, rdx
	ret