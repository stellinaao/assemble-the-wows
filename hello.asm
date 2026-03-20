; hello.asm
;
; hello world script in assembly!
;
; Author: Stellina X. Ao
; Created: 2026-03-20
; Last Modified: 2026-03-20
; human-made (for the doubters)


; create text section (def: smallest unit that can be moved around in elf files)
section         .text
global          _start      ; directive for creating programs
_start:                     ; begin the start program

    mov edx, len            ; move the length of the message to register EDX (edx expects # of bytes)
    mov ecx, msg            ; move the message to register ECX (ecx expects pointer to buffer) (E-- indicates that these registers are 32-bits wide)
    mov ebx, 1              ; set the file descriptor, 1 = stdout (i.e, print to the screen)

    mov eax, 4              ; set the system call id, 4 = write (i.e., print)
    int 0x80                ; interrupt and transfer program flow to 0x80, i.e., the linux kernel

    mov eax, 1              ; set the system call id to 1, i.e, exit
    int 0x80                ; interrupt and pass the program to the linux kernel (interface between hardware and processes) to execute

; create data section 
section         .data
    msg         db 87,111,119,32,119,111,119,32,119,111,119,46,10  ; define a byte (8 bits) (allocate real memory) containing "Wow wow wow." (in decimal) referenced with msg
    len         equ $ - msg                                        ; len of expression = current location in memory minus starting address of msg (define a symbolic constant, no mem)