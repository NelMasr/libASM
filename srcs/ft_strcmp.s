# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nel-masr <nel-masr@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/08 17:55:59 by nel-masr          #+#    #+#              #
#    Updated: 2021/03/11 11:32:57 by nel-masr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global		ft_strcmp					;int ft_strcmp(char *s1, char *s2)

ft_strcmp:
	xor		rcx, rcx				;i = 0
	xor		rax, rax				

compare:
	cmp		BYTE[rdi + rcx], 0		;if s1[i] == '\0'
	jz		return					;goto return
	cmp		BYTE[rsi + rcx], 0		;if s2[i] == '\0'
	jz		return					;goto return
	mov		al, BYTE[rsi + rcx],	;s2[i] = tmp
	cmp		BYTE[rdi + rcx], al		;if tmp != s1[i]
	jnz		return					;goto return
	inc		rcx						;else i++
	jmp		compare					;and we loop with a new value for i

return:
	movzx	rax, BYTE[rdi + rcx]	;movzx to copy only 8 bits
	movzx	rdx, BYTE[rsi + rcx]
	sub		rax, rdx
	ret
