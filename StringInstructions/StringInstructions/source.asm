; The _assembly label is the entry point of our execution.
; Do not change!

section .text
	global _assembly
	global _customMemcpy

_assembly:
	ret

; the following function demonstrates the use of rep with movs, movs is not the actual name of
; an instruction but a demonstration where you can replace s with b/w/d/q (byte, word, dword, qword)
; rep is controlled by a numeric value in ecx, and is decremented on each iteration of the loop till
; it reaches 0, when it reaches 0 then the operation ends
_customMemcpy:
	struc Params
		.oldebp			resd 1
		.oldeip			resd 1
		.dst			resd 1
		.src			resd 1
		.bytesToMove	resd 1
	endstruc

	push ebp
	mov ebp, esp

	mov ecx, [ebp + Params.bytesToMove]
	mov esi, [ebp + Params.src]
	mov edi, [ebp + Params.dst]

	rep movsb		; repeate the byte move till ecx reaches zero

	mov esp, ebp
	pop ebp
	ret