; hello_world.asm
;
; Author: Calen Young
;
; Date: 05-June-2023
;

global _start

section .text:

_start:
	mov eax, 0x4			; use the write syscall
	mov ebx, 1			; use stdout as the file descriptor
	mov ecx, message		; use the message as the buffer
	mov edx, message_length		; supply the length
	int 0x80			; invoke the syscall

	; exit

	mov eax, 0x1
	mov ebx, 0
	int 0x80

section .data:
	message: db "Hello World!", 0xA
	message_length equ $-message
