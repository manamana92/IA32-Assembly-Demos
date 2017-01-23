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
#include <Windows.h>

// This function maps to our assembly global
extern "C" int assembly(void);
extern "C" int addNumbers(int a, int b);

int main(int argc, char * argv[]) {
	// call our assembly function
	assembly();
	int x = addNumbers(1, 2);
	printf("The result of adding 1 and 2 is: %d\n", x);
	return 0;
}