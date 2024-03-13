.model small
.stack 100h
.data
    fib_array dw 16 dup(0)

.code
main PROC
    mov ax, @data
    mov ds, ax

    mov word ptr fib_array, 0
    mov word ptr fib_array + 2, 1

    mov cx, 14
    mov si, 2
fib_loop:
    mov ax, fib_array[si - 2]
    add ax, fib_array[si - 4]
    mov fib_array[si], ax
    add si, 2
    loop fib_loop

    mov cx, 16
    mov si, 0

    mov ax, 4C00h
    int 21h

main ENDP
end main
