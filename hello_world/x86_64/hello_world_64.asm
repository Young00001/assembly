; hello world in 64-bit assembly for Linux
;
; Author: Calen Young
;
; Date: 02-August-2023
;

section .data
	message db "Hello World!", 0xA
	message_length equ $-message

section .text
	global _start

_start:
	mov rax, 1			; use the write syscall
	mov rdi, 1			; use stdout as the file descriptor
	mov rsi, message		; use the message as the buffer
	mov rdx, message_length		; supply the number of bytes
	syscall				; invoke the syscall

	; exit

	mov rax, 0x3c			; system call 60 is exit
	xor rdi, rdi			; zero out rdi (exit code 0)
	syscall

