global  	ft_list_size
section 	.text

ft_list_size:
	xor     rcx, rcx

.loop:
	test	rdi, rdi
	je		.end

	inc		rcx
	mov     rdi, [rdi + 8]
	jmp     .loop

.end:
	mov     rax, rcx
	ret