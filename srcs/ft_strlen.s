# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nel-masr <nel-masr@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/08 09:12:48 by nel-masr          #+#    #+#              #
#    Updated: 2021/03/11 11:34:20 by nel-masr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global		ft_strlen

ft_strlen:						;size_t ft_strlen(const char *s)
	xor		rcx, rcx			;i = 0

loop:
	cmp		byte[rdi + rcx], 0	;if s[i] == '\0'
	jz		return				;goto return
	inc		rcx					;else rcx++
	jmp		loop				;goto loop

return:
	mov		rax, rcx			;len = i
	ret							;return(len)
