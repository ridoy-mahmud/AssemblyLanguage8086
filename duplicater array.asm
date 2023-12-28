.model small
.stack 100h
.data


.code
main proc
    
mov ax, 0
mov ds, ax
array db 1, 2, 3, 4, 5, 6, 4, 7, 8, 9, 3, 10
freq db 10 dup (0)
mov cx, 12
mov bx, offset array

count_loop:
    mov al, [bx]
    mov si, offset freq
    add si, ax
    dec si
    inc [si]
    inc bx
    dec cx
    cmp cx, 0
    jne count_loop

mov cx, 10
mov bx, offset freq

print_loop:
    mov al, [bx]
    cmp al, 1
    jle next
    mov ah, 2
    mov dl, cl
    int 21h
    mov dl, ':'
    int 21h
    mov dl, al
    int 21h
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h

next:
    inc bx
    dec cx
    cmp cx, 0
    jne print_loop

mov ah, 4ch
int 21h
main endp

end main
