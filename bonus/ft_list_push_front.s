extern	malloc

global  ft_list_push_front
section .text

;void	ft_list_push_front(t_list **begin_list, void *data)

ft_list_push_front:
	push	rbp
	mov		rbp, rsp

	mov     r8, rdi

	mov     rdi, 16
	call    malloc
	test	rax, rax
	je		.end

	mov		[rax + 0], rsi
	mov		rdx, [r8]
	mov		[rax + 8], rdx
	mov		[r8], rax

.end:
	mov		rax, 0
	pop		rbp
	ret