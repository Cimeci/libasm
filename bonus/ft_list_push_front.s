extern	malloc

; void *ft_create_elem(void *data);
global	ft_create_elem

ft_create_elem:
	push	rbp
	mov		rbp, rsp

	push	rdi
	mov		rdi, 16
	call    malloc
	pop		rdi
	test	rax, rax
	je		.end

	mov		[rax], rdi
	mov 	qword [rax + 8], 0

.end:
	pop		rbp
	ret

; void ft_list_push_front(t_list **head, void *data);
global  ft_list_push_front

ft_list_push_front:
	push	rbp
	mov		rbp, rsp

	mov     r8, rdi
	mov     rdi, rsi
	call	ft_create_elem
	test	rax, rax
	je		.end

	mov		rdx, [r8]
	mov		[rax + 8], rdx
	mov		[r8], rax

.end:
	pop		rbp
	ret