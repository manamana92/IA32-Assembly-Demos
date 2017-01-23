; The _assembly label is the entry point of our execution.
; Do not change!

section .text
	global _assembly

_assembly:
	int3

	; operands usually must be of the same length
	;mov ecx, ax	; illegal!
	add cl, ch		; ok
	;add bl, bx		; illegal!
	mov ax, bx		; ok

	; movzx - copy unsigned value from smaller register to a bigger register
	; while the high bits not set in the smaller register are zeroed out in the larger
	; register
	mov eax, 0xFFFFFFFF		; mov into eax 32 bits ; do a .format eax in windbg after this line executes
	movzx eax, al			; we are taking the first byte 0xFF and moving into eax, thus creating 0x000000FF

	; logical shift opperations
	mov eax, 0x87654321
	shl eax, 8			; shift the bits in eax to the left one byte, creates 0x65432100
	shr eax, 8			; shift the bits in eax to the right one byte, creates 0x00654321

	; rol and ror operations - bits are shifted off one and and then appended to another
	mov eax, 0x87654321
	ror eax, 4				; you will have now 0x18765432
	rol eax, 16				; you will now have 0x54321876

	mov eax, 0
	inc eax			; adds 1 to the register
	dec eax			; subtracts 1 from the register
	mov eax, 12
	sub eax, 4		; subtracts operand 2 from operand 1 and stores the results in operand 1, eax -= 4
	xor eax, eax	; bitwise xor two registers, bitwise xor means one or the other but noth both

	; loop operation
	mov ecx, 12
	mov eax, 0
	LoopLabel:
		add eax, 4
		loop LoopLabel	; decrements ecx if ecx is 0 then falls through to next instruction otherwise jumps to label

	; syntactically the above is a do while ecx != 0
		
	ret