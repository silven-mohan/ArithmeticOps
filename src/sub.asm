; Subtraction of two numbers:

section .data
	a dw 10
	b dw 5
	s db "Subtraction = "
	slen equ $-s

section .bss
	subr resw 1
	output resb 2

section .text
	global _start

_start:
	; Subtracting two number:
	mov ax, [a]		; moving a to ax.
	sub ax, [b]		; subtracting b from ax.
	mov [subr], ax		; moving the subtraction result in ax to sub.

	; convert result to ASCII(Assuming 0-9 only):
	mov al, [subr]		; moving subtraction result to al.
	add al, '0'		; convert to ASCII.
	mov [output], al	; moving al to output.
	mov byte [output+1], 0xA

	; write subtraction result to stdout:
	mov rax, 1		; syscall to write.
	mov rdi, 1		; file descriptor to stdout.
	mov rsi, s		; address of the string.
	mov rdx, slen		; length of the string to write.
	syscall			; execute write.

	mov rax, 1
	mov rdi, 1
	mov rsi, output
	mov rdx, 2
	syscall

	; exit code(0):
	mov rax, 60		; syscall to exit.
	xor rdi, rdi		; exit code(0).
	syscall			; execute exit.
