/**
This file is intended to be an analog for asm training.
- Install Visual Studio
- Install WinDBG
- Execute WinDBG with -I option from elevated command prompt to install as default postmortem debugger
- Install NASM (http://www.nasm.us/pub/nasm/releasebuilds/2.12rc7/win64/nasm-2.12rc7-installer-x64.exe)
- Take note of the install location for NASM.
- Open this project in Visual Studio...
- Right Click source.asm -> Properties
- Configuration Properites -> General -> change "Item Type" to Custom Build Tool -> click apply
- Custom Build Tool -> General
-			-> Command Line -> "C:\Users\ant92\AppData\Local\nasm" -f win32 source.asm
-			-> Outputs -> source.obj
- Try a build with F7 -> all should go well
- Try a build with CTRL + f5 to open in windbg
**/
#include <stdio.h>
#include <stdlib.h>
#include <memory.h>
#include <string.h>

// This function maps to our assembly global
extern "C" int assembly(void);
extern "C" int customMemcpy(char * dst, char * src, int bytesToMove);

// our buffer size
#define BUFFER_SIZE 32

int main(int argc, char * argv[]) {
	// call our assembly function
	assembly();

	// allocate 32 bytes for each buffer
	char * bufferA = "Fly now brown cow!\0";
	char * bufferB = (char *) malloc(BUFFER_SIZE + 1);
	memset(bufferB, 0x0, 33);	// empty out the buffer

	printf("Buffer B before copy: %s\n", bufferB);
	customMemcpy(bufferB, bufferA, strlen(bufferA));	// remember strlen does not include the null terminator but we have zeroed our memory
	printf("Buffer B after copy: %s\n", bufferB);

	free(bufferB);
	return 0;
}