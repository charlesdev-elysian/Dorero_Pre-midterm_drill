ORG 100h   ; Origin for COM program

; Data Section
val1 DW 1234h    ; Given val1 = 0x1234
val2 DW 54h      ; Given val2 = 0x54
val3 DW 0        ; Result will be stored here

; Code Section
_start:
    ; Step 1: Perform bitwise AND between val1 and val2
    MOV AX, [val1]   ; Load val1 into AX
    AND AX, [val2]   ; AX = val1 & val2

    ; Step 2: Compute (23 << 2)
    MOV BX, 23       ; Load 23 into BX
    SHL BX, 2        ; BX = 23 * 4 = 92 (0x5C)

    ; Step 3: Subtract (val1 & val2) - (23 << 2)
    SUB AX, BX       ; AX = AX - BX

    ; Step 4: Apply bitwise AND with 0xF00D
    AND AX, 0F00Dh   ; AX = AX & 0xF00D

    ; Step 5: Right shift the result by 3
    SHR AX, 3        ; AX = AX >> 3

    ; Step 6: Store the result in val3
    MOV [val3], AX   

    ; Program exit
    MOV AH, 4Ch      ; DOS function to exit
    INT 21h

END
