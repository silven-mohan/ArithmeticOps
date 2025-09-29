;; Division of Two Numbers:

section .data
	num1 dw 6
	num2 dw 3
	s1 db "Division of "
	l1 equ $-s1
	s2 db " by "
	l2 equ $-s2
	s3 db " gives :"
	l3 equ $-s3
	newline db 0xA
	s4 db "Quotient = "
	l4 equ $-s4
	s5 db ", Remainder = "
	l5 equ $-s5
	len dw 0

section .bss
	q resw 1
	r resw 1
	output resb 40

section .text
	global _start

_start:
	mov ax, [num1]
	xor dx, dx
	div word [num2]
	mov [q], al
	mov [r], dl
	
	;writing output to display the result:
	; copying s1 to output:

	mov rsi, s1
	mov rdi, output
	mov rcx, l1
	cp_s1:
		mov al, [rsi]
		mov byte [rdi], al		
		inc rsi
		inc rdi
		mov al, [len]
		inc al
		mov [len], al
		loop cp_s1

	; copying dividend to output:
	mov al, [num1]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	mov al, [len]
	inc al
	mov [len], al

	; copying s2 to output:
	mov rsi, s2
	mov rcx, l2
	cp_s2:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		mov al, [len]
		inc al
		mov [len], al
		loop cp_s2
	
	; copying divisor to output:
	mov al, [num2]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	mov al, [len]
	inc al
	mov [len], al
	
	; copying s3 to output:
	mov rsi, s3
	mov rcx, l3
	cp_s3:
		mov al, [rsi]
		mov byte [rdi], al
		inc rdi
		inc rsi
		mov al, [len]
		inc al
		mov [len], al
		loop cp_s3
	
	; writing newline to output:
	mov al, [newline]
	mov byte [rdi], al
	inc rdi
	mov al, [len]
	inc al
	mov [len], al
	
	; copying s4 to output:
	mov rsi, s4
	mov rcx, l4
	cp_s4:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		mov al, [len]
		inc al
		mov [len], al
		loop cp_s4
	
	; copying quotient to output:
	mov al, [q]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	mov al, [len]
	inc al
	mov [len], al

	; copying s5 to output:
	mov rsi, s5
	mov rcx, l5
	cp_s5:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		mov al, [len]
		inc al
		mov [len], al
		loop cp_s5
	
	; copying remainder to output:
	mov al, [r]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	mov al, [len]
	inc al
	mov [len], al

	;terminating the output with a newline character.
	mov al, [newline]
	mov byte [rdi], al
	inc rdi
	mov al, [len]
	inc al
	mov [len], al
	
	mov rax, 1		; syscall for write.
	mov rdi, 1		; file descriptor to stdout
	mov rsi, output		; address of the string.
	mov rdx, len		; length of the string.
	syscall			; execute write.

	; exit
	mov rax, 60		; syscall for exit.
	xor rdi, rdi		; exit code = 0
	syscall 		; execute exit.
	
	
	
