global ft_atoi_base
section .text

ft_atoi_base:
	xor		rax, rax
	mov		rcx, 0
	mov		rdx, 1

	mov		al, [rdi + rcx]
	test	al, al
	je		.end

    cmp     al, '-'
    jne     .check_plus
    mov     rdx, -1
    inc     rcx
	jne		.start_loop

.check_plus:
    cmp     al, '+'
    jne     .start_loop
    inc     rcx

.start_loop:
.loop:
	mov		al, [rdi + rcx]
	test	al, al
	je		.end

	sub		al, '0'
	cmp		al, 9
	je		.end

	imul 	rax, rax, 10
	movzx   r8d, al
	add		rax, r8

	inc rcx
	jmp .loop

.end
	imul rax, rdx
	ret