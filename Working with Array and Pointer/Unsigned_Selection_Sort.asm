; Unsigned_Selection_Sort.asm
;
; Author:               Peter Mitchell
; Student Number:       040-971-631
; Date:                 5 August 2020
;
; Purpose:              sort an array of cards
;

; a: a is used to store the lowest value found as it loops
; b: is used as a temporary variable (for comparing and moving)
; x: is the index the search is at
; y: is used to store pointers

STACK   equ     $2000

        org     $1000 ; store the array of cards
cards   db      $08, $04, $05, $0e, $09, $09, $05, $08, $08, $0d
endCards

        ; Putting the variables used in sort in a different place to
        ; make it easier to see the data
        org     $1010
; The first index it's looking at. finding the lowest number to put there
first   dw      #$1000
; the lowest number found as it's searching
lowest  dw      #$1000
        
        org     $2000
	lds     #STACK

selStrt ldx     lowest
        ldaa    0,x  	; load with first (currently lowest) value

Sel        inx
        ldab    0,x 	; load b with current search value
        
        ;if it's at the end, go to swap
        cpx     #endCards
        beq     Swap
        
        cba             ; compare a and b
        blo     Sel     ; if old lowest is still lowest continue search

        ; move new lowest into old lowest, and update lowest index
        tba     ; move new lowest into a
        stx     lowest ; store index of new lowest in lowest

        bra     Sel


; swap the values and go to next "first"
Swap    ldx     lowest    ; pointer to the start value of the swap
        ldy     first      ; pointer to the destination
        
        ldaa    0,x     ; store the two values somewhere movable
        ldab    0,y
        
        staa    0,y
        stab    0,x

        ;increment the start index
        iny
        inc     first+1    ;this could also be stx si+1
        sty     lowest
        
        cpy     #endCards-1     ; compare y with the index of the last index
        blo     SelStrt         ; branch if not at the end

        