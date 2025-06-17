extern		free

;void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
global ft_list_remove_if

ft_list_remove_if:
	push	rbp
	mov		rbp, rsp
	push	rbx

	mov		rbx, rsi
	mov		r10, rdi
	mov     r8, [rdi]
	xor		r9, r9

.loop:
	test    r8, r8
	je      .end

	mov     rdi, [r8]
	mov		rsi, rbx
	call    rdx

	cmp     eax, 0
	jne		.next

	mov		r11, [r8 + 8]
	mov		rdi, [r8]
	call	rcx

	mov     qword [r8 + 8], 0
	mov		rdi, r8
	call	free

	test	r9, r9
	je		.update_head

    mov     [r9 + 8], r11
    mov     r8, r11
    jmp     .loop

.update_head:
	mov		[r10], r11
	mov		r8, r11 
	jmp		.loop

.next:
	mov		r9, r8
	mov		r8, [r8 + 8]
	jmp		.loop

.end:
	pop		rbx
	pop		rbp
	ret