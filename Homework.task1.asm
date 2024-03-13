.model small
.stack 100h
.data
    array dw 10 DUP(0)
.code
main PROC
    mov ax, @data
    mov ds, ax

    mov bx, 0
    mov cx, 0
    mov ax, 1
array_loop:
    mov[array + bx], ax
    add bx, 2
    inc ax
    inc cx
    cmp cx, 10
    jne array_loop

    mov ax, 4C00h
    int 21h
 main endp
 end main