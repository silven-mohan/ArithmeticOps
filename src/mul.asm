;; Multiplication of Numbers:

section .data
	num1 dw 1
	num2 dw 5
	s1 db "Multiplication of "
	l1 equ $-s1
	s2 db " by "
	l2 equ $-s2
	s3 db " is : "
	l3 equ $-s3
	newline db 0xA
	len dw 0

section .bss
	num3 resw 1
	output resb 40

section .text
	global _start

_start:
	; Multiplication of Two Numbers:
	mov ax, [num1]		; moving num1 to al.
	imul ax, [num2]		; multiplying al by num2.
	mov [num3], ax		; storing the result in num3.
	
	; writing a output to display the multiplication result:
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

	; copying first operand to output:
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

	; copying second operand to output:
	mov al, [num2]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	mov al, [len]
	inc al
	mov [len], al

	;copying s3 to output:
	mov rsi, s3
	mov rcx, l3
	cp_s3:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		mov al, [len]
		inc al
		mov [len], al
		loop cp_s3
	
	;copying multiplication result to output:
	mov al, [num3]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	mov al, [len]
	inc al
	mov [len], al

	;terminate output new-line character:
	mov al, [newline]
	mov byte [rdi], al
	inc rdi 
	mov al, [len]
	inc al
	mov [len], al

	mov rax, 1			; syscall for write.
	mov rdi, 1			; file descriptor to stdout.
	mov rsi, output			; address of the string to write.
	mov rdx, len			; length of the string to write.
	syscall				; execute write.

	; exit
	mov rax, 60			; syscall for exit
	xor rdi, rdi			; exit code = 0
	syscall				; execute exit.

