;; Arithmetic Operations:

section .data
	a1 dw 1
	a2 dw 2
	s1 dw 5
	s2 dw 2
	i1 dw 1
	mlt1 dw 1
	mlt2 dw 5
	d1 dw 6
	d2 dw 3
	m1 db "------------------------------", 0xA
	ml1 equ $-m1
	m2 db "    Arithmetic Operations     ", 0xA
	ml2 equ $-m2
	as1 db "Addition of "
	asl1 equ $-as1
	as2 db " by "
	asl2 equ $-as2
	as3 db " is : "
	asl3 equ $-as3
	ss1 db "Subtraction of "
	ssl1 equ $-ss1
	ms1 db "Multiplication of "
	msl1 equ $-ms1
	ds1 db "Division of "
	dsl1 equ $-ds1
	is1 db "Increment of "
	isl1 equ $-is1
	des1 db "Decrement of "
	desl1 equ $-des1
	len dw 0
	g1 db "  gives :", 0xA
	gl1 equ $-g1
	di1 db "Quotient = "
	dil1 equ $-di1
	di2 db", Remainder = "
	dil2 equ $-di2
	newline db 0xA

section .bss
	ar resw 1
	sr resw 1
	ir resw 1
	dr resw 1
	mr resw 1
	q resw 1
	r resw 1
	output resb 100

section .text
	global _start

_start:
	; --- Arithmetic Operations --- :
	; Writing an output message for heading:
	; Append "-------":
	mov rsi, m1
	mov rdi, output
	mov rcx, ml1
	mov word [len], 0
	cp_1:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_1

	; Append "Arithmetic Operations:":
	mov rsi, m2
	mov rcx, ml2
	cp_2:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_2

	; Append "------":
	mov rsi, m1
	mov rcx, ml1
	cp_3:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_3

	; - Addition - :
	mov al, [a1]
	add al, [a2]
	mov [ar], al

	; Writing an output message for Addition:
	; Append "Addition of ":
	mov rsi, as1
	mov rcx, asl1
	cp_4:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_4
	
	; Append a1:
	mov al, [a1]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	inc word [len]
	
	; Append " by ":
	mov rsi, as2
	mov rcx, asl2
	cp_5:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_5

	; Append a2:
	mov al, [a2]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	inc word [len]

	; Append " is : ":
	mov rsi, as3
	mov rcx, asl3
	cp_6:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_6

	; Append ar:
	mov al, [ar]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	inc word [len]
	
	; Append Newline:
	mov al, [newline]
	mov byte [rdi], al
	inc rdi
	inc word [len]

	; -- Subtraction -- :
	mov al, [s1]
	sub al, [s2]
	mov [sr], al

	; Writing an output message for Subtraction:
	; Append "Subtraction of ":
	mov rsi, ss1
	mov rcx, ssl1
	cp_7:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_7

	; Append s1:
	mov al, [s1]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	inc word [len]

	; Append " by ":
	mov rsi, as2
	mov rcx, asl2
	cp_8:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_8
	
	; Append s2:
	mov al, [s2]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	inc word [len]
	
	; Append " is : ":
	mov rsi, as3
	mov rcx, asl3
	cp_9:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_9

	; Append sr:
	mov al, [sr]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	inc word [len]
	
	; Append Newline
	mov al, [newline]
	mov byte [rdi], al
	inc rdi
	inc word [len]

	; -- Increment --
	mov al, [i1]
	inc al
	mov [ir], al

	; Writing a message to output for Increment:
	; Append "Increment of ":
	mov rsi, is1
	mov rcx, isl1
	cp_10:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_10

	; Append i1:
	mov al, [i1]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	inc word [len]	

	; Append " by ":
	mov rsi, as2
	mov rcx, asl2
	cp_11:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_11

	; Append i1 =1:
	mov al, [i1]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	inc word [len]

	; Append " is : ":
	mov rsi, as3
	mov rcx, asl3
	cp_12:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_12
	
	; Append ir:
	mov al, [ir]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	inc word [len]

	;Append Newline:
	mov al, [newline]
	mov byte [rdi], al
	inc rdi
	inc word [len]
	
	; -- Decrement --:
	mov al, [ir]
	dec al
	mov [dr], al

	; Writing a message to output for Decrement:
	mov rsi, des1
	mov rcx, desl1

	; Append "Decrement of " :
	cp_13:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_13

	; Append ir:
	mov al, [ir]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	inc word [len]
	
	; Append " by ":
	mov rsi, as2
	mov rcx, asl2
	cp_14:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_14

	; Append i1=1:
	mov al, [i1]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	inc word [len]
	
	; Append " is :":
	mov rsi, as3
	mov rcx, asl3
	cp_15:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_15

	; Append dr:
	mov al, [dr]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	inc word [len]

	; Append newline:
	mov al, [newline]
	mov byte [rdi], al
	inc rdi
	inc word [len]

	; -- Multiplication -- :
	mov ax, [mlt1]
	imul ax, [mlt2]
	mov [mr], ax

	; Writing a message to output for Multiplication:
	; Append "Multiplication of ":
	mov rsi, ms1
	mov rcx, msl1
	cp_16:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_16

	; Append mlt1:
	mov al, [mlt1]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	inc word [len]
	
	; Append " by ":
	mov rsi, as2
	mov rcx, asl2
	cp_17:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_17

	; Append mlt2:
	mov al, [mlt2]
	add al, '0'
	mov byte [rdi], al
	inc rdi	
	inc word [len]
	
	; Append " is :":
	mov rsi, as3
	mov rcx, asl3
	cp_18:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_18
	
	; Append mr:
	mov al, [mr]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	inc word [len]
	
	; Append newline:
	mov al, [newline]
	mov byte [rdi], al
	inc rdi
	inc word [len]

	; -- Division --:
	mov ax, [d1]
	xor dx, dx
	div word [d2]
	mov [q], al
	mov [r], dl

	; Writing output message to ouput for Division:
	; Append "Division of ":
	mov rsi, ds1
	mov rcx, dsl1
	cp_19:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_19

	; Append d1:
	mov al, [d1]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	inc word [len]
	
	; Append " by ":
	mov rsi, as2
	mov rcx, asl2
	cp_20:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_20

	; Append d2:
	mov al, [d2]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	inc word [len]

	; Append " gives :":
	mov rsi, g1
	mov rcx, gl1
	cp_21:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_21

	; Append "Quotient = ":
	mov rsi, di1
	mov rcx, dil1
	cp_22:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_22

	; Append q:
	mov al, [q]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	inc word [len]
	
	; Append ", Remainder = ":
	mov rsi, di2
	mov rcx, dil2
	cp_23:
		mov al, [rsi]
		mov byte [rdi], al
		inc rsi
		inc rdi
		inc word [len]
		loop cp_23

	; Append r:
	mov al, [r]
	add al, '0'
	mov byte [rdi], al
	inc rdi
	inc word [len]

	; Append newline:
	mov al, [newline]
	mov byte [rdi], al
	inc rdi 
	inc word [len]


	; Write output to stdout:
	mov rax, 1		; syscall for write.
	mov rdi, 1		; file descriptor to stdout.
	mov rsi, output		; address of output.
	movzx rdx, word [len]		; length of output.
	syscall			; execute write.

	;exit
	mov rax, 60		; syscall for exit
	xor rdi, rdi		; exit code = 0.
	syscall			; execute exit.
	
		
