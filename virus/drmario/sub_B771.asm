; =============== S U B R O U T I N E =======================================

; Y contains the number of bytes to rotate right one bit. When Y is 0 it's as if Y were 256.
; X contains an offset from memory location 0 to start operating on.
; Memory locations 0+X to 0+X+Y-1 contain data to operate on.
;
; The first word of memory is treated specially; firstly, the byte at 0+X will be ANDed with 2
; before operations procede, then if (m(0+X) & 2) ^ (m(1+X) & 2) == 0, where m(?) is
; "memory at location ?", the right rotating will begin with the carry flag cleared;
; if that EOR expression isn't zero, the right rotating will begin with the carry flag set.

sub_B771:                               ; CODE XREF: sub_82A0+Cp sub_9953+89p ...
                LDA     0,X             ; A = m(0+X)
                AND     #2              ; A &= 2
                STA     word_0          ; m(0) = A
                LDA     1,X             ; A = m(1+X)
                AND     #2              ; A &= 2
                EOR     word_0          ; A ^= m(0)
                                        ; Or this and the above lines can be interpreted:
                                        ; A = (m(0+X) & 2) ^ (m(1+X) & 2)
                CLC                     ; Clear carry flag
                BEQ     loc_B781        ; If the EOR resulted in 0, branch
                SEC                     ; Otherwise, set carry flag

loc_B781:                               ; CODE XREF: sub_B771+Dj sub_B771+14j
                ROR     0,X             ; Rotate right a byte, with the carry flag too
                INX
                DEY
                BNE     loc_B781
                RTS
; End of function sub_B771
