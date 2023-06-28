;
;
;
;
;
;
;


global _start

section .data:
	dir_name db 'test_dir', 0

section .text:
	nop			; DEBUG
	
_start:
	
	; Open the directory	
	
	mov eax, 0x5		; use the open syscall
	mov ebx, dir_name	; specify the directory name
	mov ecx, 0		; flags (0_RD0NLY)
	; mov edx, eax		; store the file descriptor in edx
	int 0x80		; invoke the syscall
	
	
	; Remove the directory
	
	mov eax, 0x28		; use the rmdir syscall
	mov ebx, dir_name	; use the file descriptor
	int 0x80
	
	
	; Exit the program
	
	mov eax, 0x1
	xor ebx, ebx
	int 0x80
	
error:
	; Handle error
	
	mov eax, 0x4		; use the write syscall
	mov ebx, 0x1		; stdout
	mov ecx, error_msg	; use message as the buffer
	mov edx, error_len	; provide message length
	int 0x80
	
	; Exit the program
	
	mov eax, 0x1
	mov ebx, 0x1
	int 0x80
	
section .data:
	error_msg db "Error occured", 0
	error_len equ $-error_msg
