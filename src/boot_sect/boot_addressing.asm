;
; A simple boot sector program that demonstrates addressing
;

mov ah, 0x0e			; int 10/ah = 0eh 
						; -> scrolling teletype BIOS routine

; First attempt
mov al, the_secret
int 0x10				; does this print an X?

; Second attemp
mov al, [the_secret]
int 0x10				; does this print an X?

; Third attempt
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10				; does this print an X?

; Fourth attempt
mov al, [0x7c1e]
int 0x10				; does this print an X?

jmp $					; Jump forever.

the_secret:
	db "X"

; Padding and magic BIOS number

times 510-($-$$) db 0
dw 0xaa55	