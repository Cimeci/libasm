extern		ft_strlen, ft_atoi_check_base

global		ft_atoi_base
section 	.text

ft_atoi_base:
	call	ft_atoi_check_base
	cmp		rax, 0
	je		.end
	xor		rax, rax
	xor		rcx, rcx
	mov		rdx, 1
	mov		r9,	rdi
	mov		rdi, rsi
	call	ft_strlen
	mov		r11, rax
	mov		rdi, r9
	xor		rax, rax

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
	xor		r8d, r8d

.find_char_loop:
	cmp		r8d, r11d
	je		.end
	mov		r10b, [rsi + r8]
	cmp		r10b, bl
	je		.char_found
	inc		r8d
	jmp		.find_char_loop

.char_found:
	imul	rax, r11
	add		rax, r8

	inc		rcx	
	jmp		.loop

.end:
	imul	rax, rdx
	ret