global ft_atoi_sign_space
section .text

ft_atoi_sign_space:
	xor		rax, rax
	xor		rcx, rcx
	mov		rdx, 1

.skip_space:
	mov		bl, [rdi + rcx]
	cmp		bl, ' '
	je		.inc_rcx
	cmp		bl, 9
	je		.inc_rcx
	cmp		bl, 10
	je		.inc_rcx
	cmp		bl, 13
	je		.inc_rcx
	cmp		bl, 11
	je		.inc_rcx
	cmp		bl, 12
	je		.inc_rcx
	jmp		.main

.inc_rcx:
	inc		rcx
	jmp		.skip_space

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
	cmp     bl, ' '
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