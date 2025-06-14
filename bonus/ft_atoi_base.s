extern		ft_strlen

global		ft_atoi_base
section 	.text

ft_atoi_base:
	xor		rcx, rcx
	mov		rdx, 1
	mov		r9,	rdi
	mov		rdi, rsi
	call	ft_strlen
	mov		rex, rax
	xor		rax, rax

.skip_space:
	mov		bl, [rdi + rcx]
	cmp		bl, 32
	jne		.main
	inc		rcx
	jmp		.skip_space

.skip_white:
	sub		bl, 9
	cmp		bl, 4
	ja		.end
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

	imul 	rax, rax, rex
	movzx   r8d, bl
	add		rax, r8

	inc rcx
	jmp .loop

.end:
	imul	rax, rdx
	ret