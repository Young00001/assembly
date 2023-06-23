; new_dir.asm
;
; Author: Null
;
; Date: 23-June-2023
;

global _start

section .text:
	nop			; DEBUG
	
_start:
	mov eax, 0x27		; use the mkdir syscall
	mov ebx, dir_name	; specify directory name
	mov ecx, 0x777		; change permissions
	int 0x80		; invoke the syscall
	
	; exit
	
	mov eax, 0x1
	mov ebx, 0
	int 0x80
	
section .data:
	dir_name db 'test', 0
