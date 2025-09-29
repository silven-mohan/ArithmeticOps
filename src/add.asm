; Addition of Two Numbers:

section .data
	a dw 1
	b dw 4
	s1 db "Sum = "
	ls equ $-s1

section .bss
	sum resw 1
	output resb 2

section .text
	global _start

_start:
	; Adding Two Numbers:
	mov ax, [a]		; moving a to ax.
	add ax, [b]		; adding two numbers.
	mov [sum], ax		; moving the addition result to sum.

	; convert sum to ASCII(assuming 0-9):
	mov al, [sum]		; moving sum to al.
	add al, '0'		; converting result to ASCII.
	mov [output], al	; moving the result to output.
	mov byte [output+1], 0xA 	; moving new-line to output.

	; write "Sum = " to stdout:
	mov rax, 1		; syscall to write.
	mov rdi, 1		; file descriptor to stdout.
	mov rsi, s1
	mov rdx, ls		; length of the string to write.
	syscall			; execute write.

	;write the sum to stdout:
	mov rax, 1		; syscall to write.
	mov rdi, 1		; file descriptor to stdout.
	mov rsi, output		; address of the string to write.
	mov rdx, 2		; length of the string.
	syscall			; execute write.

	;exit(0):
	mov rax, 60		; syscall to exit.
	xor rdi, rdi		; exit code = 0.
	syscall			; execute exit.
