    lda #$00    ; byte inferior de $0200 (vidmem)
    sta $00
    lda #$02    ; byte superior de $0200 (vidmem)
    sta $01

    lda #$FF    ; pixeles totales en un sector
    sta $02

    lda #$05    ; limite de memoria de video (vidmem)
    sta $03

    lda #$05    ; color
    ldy #$00    ; offset de memoria

loop:
    sta ($00),Y ; vid_mem + offset
    cpy $02     ; y == $FF?
    beq resetY  ; si? pues saltas a resetY
    iny         ; no? pues sumas 1 a Y...
    jmp loop    ; y saltas a loop

resetY:
    ldy #$00    ; offset en 0 otra vez
    ldx $01     ; cargas a x en valor en $0001 (5)
    cpx $03     ; x == 5?
    beq end     ; si? pues termina el programa
    inc $01     ; no? incrementas el valor en $0001 por uno
    jmp loop    ; y saltas a loop

end:
    brk         ; termina el programa