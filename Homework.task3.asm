.MODEL SMALL
.stack 100h

.DATA
     array dw 20*5 DUP(0)

.CODE

main proc
    mov ax, @data
    mov ds, ax

    mov ch, 0 ;x
    mov cl, 0 ;y

myloop:
xor ah, ah
mov al, ch ;al = x
add al, 2 ;x+2
mov bl, cl ;bl = y
xor bh, bh
add bl, 3 ;y+3
mul bx
mov bx, ax

mov ax, 5
mul ch

mov dl,cl
xor dh,dh
add ax,dx

shl ax, 1

xchg ax, bx

mov [array + bx], ax
inc cl
cmp cl,5
jne myloop
mov cl, 0
inc ch
cmp ch, 20
jne myloop

mov ax, 4C00h
int 21h

main ENDP
END main