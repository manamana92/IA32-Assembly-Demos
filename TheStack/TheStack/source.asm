; The _assembly label is the entry point of our execution.
; Do not change!

section .text
	global _assembly

_assembly:
	int3

	; the stack is always 32-bit aligned and we have some new commands
	sub esp, 4					; decrement esp to make room
	mov dword [esp], 0xbeefbeef	; write a value located at [esp]
	add esp, 4					; clean up the stack

	; this is equivalent to
	mov eax, 4				; put the value 4 into eax register
	push eax				; push that value onto the stack
	mov eax, 13				; do some temp work with eax
	pop eax					; restore eax to the value on the stack

	ret