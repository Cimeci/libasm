extern		ft_strlen

global		ft_atoi_check_base
section 	.text

ft_atoi_check_base:
	xor		rcx, rcx
	mov		rdx, 1
	mov		r9,	rdi
	mov		rdi, rsi
	call	ft_strlen
	mov		r11, rax
	mov		rdi, r9
	xor		rax, rax
	xor		r8, r8
	inc		r8

.check_len:
	cmp		r11, 2
	jb		.end

.check_chars_loop:
	mov		al, [rsi + rcx]
	test	al, al
	je		.check_duplicates

	cmp		al, '0'
	jl		.end
	cmp		al, '9'
	jle		.char_ok
	
	cmp		al, 'A'
	jl		.end
	cmp		al, 'Z'
	jle		.char_ok

	cmp		al, 'a'
	jl		.end
	cmp		al, 'z'
	jle		.char_ok
	
	jmp		.end

.char_ok:
	inc		rcx
	jmp		.check_chars_loop


.check_duplicates:
    xor r8, r8

.next_char:
    mov 	al, [rsi + r8]
    test 	al, al
    je 		.valid

    mov 	r9, r8
    inc 	r9

.inner_loop:
    mov 	bl, [rsi + r9]
    test	bl, bl
    je		.continue_outer

    cmp 	al, bl
	je		.end

	inc		r9
	jmp 	.inner_loop

.continue_outer:
    inc		r8
    jmp		.next_char

.valid:
    mov		rax, 1
    ret

.end:
    xor		rax, rax
    ret