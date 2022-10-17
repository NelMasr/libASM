# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nel-masr <nel-masr@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/10 12:44:06 by nel-masr          #+#    #+#              #
#    Updated: 2021/03/10 13:17:45 by nel-masr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global		ft_strdup
extern		ft_strlen
extern		ft_strcpy
extern		malloc

ft_strdup:
	push	rdi
	call	ft_strlen			;rax = ft_strlen(rdi)
	inc		rax					;rax++ (so we have space for \0)
	mov		rdi, rax			;rdi = rax
	call	malloc wrt ..plt	;rax = malloc(rdi)
	cmp		rax, 0				;compare rax to 0 to see if malloc failed
	je		end					;if it did fail, jump to end
	pop		rdi
	mov		rsi, rdi			;rsi = rdi
	mov		rdi, rax			;rdi = rax
	call	ft_strcpy			;rax = ft_strcpy(rdi, rsi)
	jmp		end

end:
	ret
