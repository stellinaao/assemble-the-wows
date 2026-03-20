### Installation
First, install the assembler (NASM) and linker (ld).
```sudo apt install nasm build-essential```

### Running
1. Create an elf-compatible object file.
```nasm -f elf32 hello.asm -o hello.o```
2. Create an executable.
```ld -m elf_i386 hello.o -o hello```
3. Run the executable.
```./hello```
