org 100h ; Origin of the COM programs

.data
    array DW 8, 25, 59, 33, 47, 0               ; Array of 6 word values (including 0)
    largest DW 0                                ; Variable to store the largest number

.code
    mov cx, 6                                   ; Counter to loop through the array (6 elements)
    mov si, offset array                        ; load the address of the array into SI
    mov ax, [si]                                ; load the first element of the array into AX
    add si, 2                                   ; move to the next element

find_largest:
    mov dx, [si]                                ; load the current element of the array into DX
    cmp ax, dx                                  ; compare the current element with the largest number
    jge skip                                    ; if the current element is not larger, go to the next element
    mov ax, dx                                  ; update the largest number

skip:
    add si, 2                                   ; move to the next element
    loop find_largest                          ; repeat the process for all elements in the array
    mov largest, ax                             ; store the largest number in the variable
    mov ah, 4ch                                 ; DOS function to exit
    int 21h                                     ; Call DOS

    End
