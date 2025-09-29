;; Increment of a Number:

section .data
	num dw 1
	s1 db "Increment of "
	l1 equ $-s1
	s2 db " by 1 is : "
	l2 equ $-s2
	newline db 0xA
	len dw 0

section .bss
	num1 resw 1
	output resb 40

section .text
	global _start

_start:
	; Incrementing num by 1:
	mov ax, [num]			; moving num to ax.
	inc ax				; incrementing ax.
	mov [num1], ax			; storing increment result in num1.

	; writing an output to show the increment result:
	; copy s1 to output:
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
		mov[len], al
		loop cp_s1

	; copy increment operand to output:
	mov al, [num]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	mov al, [len]
	inc al
	mov [len], al

	; copy s2 to output:
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
	
	; copy increment result to output:
	mov al, [num1]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	mov al, [len]
	inc al
	mov [len], al		
	
	;terminate output with new-line character:
	mov al, [newline]
	mov byte [rdi], al
	inc rdi 
	mov al, [len]
	inc al
	mov [len], al

	mov rax, 1			; syscall for write
	mov rdi, 1			; file descriptor to stdout.
	mov rsi, output			; address of the string to write.
	mov rdx, len			; length of the string.
	syscall				; execute write.

	; exit:
	mov rax, 60			; syscall for exit.
	xor rdi, rdi			; exit code = 0
	syscall				; execute exit.
