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
call sub_x_plus_2_mul_y_plus_3
mov bx, ax
mov bl,ch
xor bh,bh
mov dl,cl
xor dh,dh
call sub_save_in_array

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

sub_x_plus_2_mul_y_plus_3 proc

xor ah, ah
mov al, ch ;al = x
add al, 2 ;x+2
mov bl, cl ;bl = y
xor bh, bh
add bl, 3 ;y+3
mul bx

sub_x_plus_2_mul_y_plus_3 ENDP

sub_save_in_array PROC
push ax
mov ax, 5
push dx
mul bx
pop dx
add ax,dx

shl ax, 1

xchg ax, bx
 
pop ax

mov [array + bx], ax
sub_save_in_array ENDP

END main