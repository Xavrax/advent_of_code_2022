SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
SYS_OPEN  equ 5
SYS_CLOSE equ 6

STDIN     equ 0
STDOUT    equ 1

F_READ    equ 0
F_RWX     equ 0777

BUFFER_SIZE equ 1000

section .data
    start_message db 'Start!', 0xa
    start_message_lenght equ $ - start_message

    file_name db 'input.txt'


section .bss
    input_fd resb 1
    buffer resb BUFFER_SIZE


section .text
    global _start

%macro print 2
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

_start:
    print start_message, start_message_lenght

    call open_file
    mov [input_fd], eax

    call read_file

    print buffer, BUFFER_SIZE

    call close_file
    jmp _exit

open_file:
    mov eax, SYS_OPEN
    mov ebx, file_name
    mov ecx, F_READ
    mov edx, F_RWX
    int 0x80
    ret

read_file:
    mov eax, SYS_READ
    mov ebx, [input_fd]
    mov ecx, buffer
    mov edx, BUFFER_SIZE
    int 0x80
    ret

close_file:
    mov eax, SYS_CLOSE
    mov ebx, [input_fd]
    int 0x80
    ret

_exit:
    mov eax, SYS_EXIT
    int 0x80

