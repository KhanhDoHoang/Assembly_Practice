; Exchange_Elements.asm
;
; Author:               Peter Mitchell
; Student Number:       040-971-631
; Date:                 5 August 2020
;
; Purpose:              reverse the order of an array
;

STACK           equ     $2000

;making the array of elements
                org	$1000
Elements        db 	123, 113, 064, 046, 031, 165, 105, 034, 121, 133, 067
                db	127, 123, 113, 097, 076, 055, 122, 139, 098, 117, 182
                db	176, 116, 069
EndElements

Len             equ     #EndElements-#Elements    	; sizeof() = length of array (25)

                org     $2000
           	lds     #STACK

                ; x and y will be the counters to go through the array
                ldx     0                       	; start index is 0
                ldy     #EndElements-#Elements-1 	; index of last element
SwapLoop        ldaa    Elements,x

                ; load element+18 into b
                ; store b in elements
                ldab    Elements,y
                stab    Elements,x

                staa    Elements,y      	; store at elements+length-1
                
                dey     ; increment/decrement the counters
                inx
                
                ; transfer to a and b to be compared
                tfr     x,a
                tfr     y,b
                cba
                ; stop if x >= y, branch if x < y
                blo     SwapLoop
                
                
                