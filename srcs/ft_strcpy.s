# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nel-masr <nel-masr@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/08 15:33:56 by nel-masr          #+#    #+#              #
#    Updated: 2021/03/11 11:33:46 by nel-masr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global		ft_strcpy			;char* ft_strcpy(const char *dst, const char *src)


ft_strcpy:
	xor		rcx, rcx			;i = 0;

copy:
	cmp		byte[rsi + rcx], 0	;if src[i] == '\0'
	jz		return				;goto return
	mov		dl, [rsi + rcx]		;copy the char [rsi + rcx] in dl
	mov		[rdi + rcx], dl		;copy the char in dl back in the char [rdi + rcx]
	inc		rcx					;i++
	jmp		copy				;goto copy

return:
	mov		byte[rdi + rcx], 0	;dest[i] = '\0'
	mov		rax, rdi			;dest = copied_dest
	ret							;return(copied_dest)
