.model small


.data

.code
    main proc
        mov AX, 36      ; Перше число
        mov BX, 24      ; Друге число

        call euclid      ; Виклик функції для знаходження НСД

        mov AX, 4C00h   ; Код завершення програми
        int 21h
    main endp

    ; Підпрограма, що реалізує алгоритм Евкліда
    euclid proc
        push BX         ; Зберегти BX на стеку
    loop_start:
        cmp AX, BX      ; Порівняти AX та BX
        jz done         ; Якщо AX = BX, то завершення

        ja bigger       ; Якщо AX > BX, то виконується bigger
        sub BX, AX      ; Відняти AX від BX
        jmp loop_start  ; Перейти до початку циклу
    bigger:
        sub AX, BX      ; Відняти BX від AX
        jmp loop_start  ; Перейти до початку циклу
    done:
        pop BX          ; Відновити значення BX зі стеку
        ret             ; Повернутися до main
    euclid endp

end main