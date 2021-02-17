; Math_Operations.asm
;
; Author:         D. Haley
; Student Number: nnn-nnn-nnn
; Date:           22 Feb 2018
;
  Purpose:        To Gain Experience with Assembly Language instructions

; Program Constants
	STACK   equ     $2000

org     $1000           ; Data starts at $1000
	MyArray db      $0C,$81
Result  ds      2

        org     $2000           ; Program Code starts at $2000
Start   lds     #STACK          ; Setup the stack

ldaa    #$25            ; Note: This code is purposely NOT documented
        ldab    #25
        adda    MyArray
        staa    Result
        stab    Result+1
        ldaa    Result+1
        ldab    Result
        incb
        ldaa    #%10101010
        std     Result
        swi
        end