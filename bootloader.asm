[org 0x7c00]

mov bp, 0x7c00  			;this where the kernel get loaded to fist time and start running
mov sp, bp				;put the stack pointer to 0x7c00

mov bx, TestString			;make bx register to point to the first adress of the TestString variable
call PrintString			;call the printstring function

jmp $

PrintString:
	mov ah, 0x0e			;needed to print a text
	.Loop:
	cmp [bx], byte 0
	je .Exit
		mov al, [bx]			;take the content of the adress referd to by bx register
		int 0x10
		inc bx
		jmp .Loop
	.Exit:
	ret

TestString:
	db "This is a test string",0

times 510-($-$$) db 0
dw 0xaa55
