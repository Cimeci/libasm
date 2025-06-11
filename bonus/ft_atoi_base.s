global ft_atoi_base
section .text

ft_atoi_base:
	xor		rax, rax
	xor		rcx, rcx
	mov		rdx, 1

.main:
	mov		al, [rdi + rcx]
	cmp		al, '-'
	jne		.check_plus
	mov		rdx, -1
	inc		rcx
	jmp		.read_loop_char

.check_plus:
	cmp		al, '+'
	jne		.read_loop_char
	inc		rcx

.read_loop_char:
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