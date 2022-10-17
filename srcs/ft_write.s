# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nel-masr <nel-masr@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/09 15:52:45 by nel-masr          #+#    #+#              #
#    Updated: 2021/03/11 11:20:35 by nel-masr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global		ft_write
extern		__errno_location

ft_write:
	mov		rax, 1						;syscall for write
	syscall
	cmp		rax, 0						;compare return value with 0
	jl		error						;if comparison's result is lower than 0, jump to error
	ret

error:
	neg		rax							;rax's value was negative so we make it positive
	mov		rdi, rax					;rax will change when we call errno so we store it in rdi
	call	__errno_location wrt ..plt	;we call errno - rax now points to errno's memory address
	mov		[rax], rdi					
	mov		rax, -1						;write should return -1 if an error has been encountered
	ret
