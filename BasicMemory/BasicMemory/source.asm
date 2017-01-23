; The _assembly label is the entry point of our exection.
; Do not change!

section .text
	global _assembly

_assembly:
	int3
	; Memory Access
	mov eax, edx
	; eax and edx now have the same value
	mov dword [edx], 3
	; check both values of eax and edx in windbg at this point
	mov dword [eax], 4
	; check both values of eax and edx in windbg, they should still have the same memory location
	; and modify the same position in memory, commands "deax", "dedx"
	; instructions do not support multiple memory addresses!
	; mov [eax], [edx] ; INVALID!

	; multiple ways to access memory
	sub eax, 4
	mov byte [eax + 4], 7
	; at this point we just moved 7 into where edx is point, check with "dedx" command in windbg
	; this form of memory access is known as base + displacement

	; lea instruction
	lea eax, [edx]
	mov byte [eax], 18
	; takes the calculation from the second operand and places it in the first operand, can also be used for math
	lea eax, [17 - 5]

	ret