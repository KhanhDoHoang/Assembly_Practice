;Indexed_Addressing.asm

        org     $1000
Array   db      $15,$02,$9F,$11,$98

        org     $2000
;Indexed Addressing mode with constant offset

        ldx 	#Array
        ldaa    0,X
        ldab    3,X
        ldx     #Array+2
        ldaa    -1,X
        
        ldy     #$0FEF
        ldaa    B,Y
        
        swi
        end
        