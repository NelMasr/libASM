# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nel-masr <nel-masr@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/10 11:28:05 by nel-masr          #+#    #+#              #
#    Updated: 2021/03/11 11:20:54 by nel-masr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global	ft_read
extern	__errno_location

ft_read:
	mov		rax, 0							;syscall for read
	syscall
	cmp		rax, 0							;compare return value with 0
	jl		error							;if comparison result is < 0, jump to error
	ret

error:
	neg		rax								;rax's value is now positive
	mov		rdi, rax						;we store rax's current value (errno's value) in rdi
	call	__errno_location wrt ..plt		;rax now points to errno's memory address
	mov		[rax], rdi
	mov		rax, -1							;read should return -1 in case of error
	ret
