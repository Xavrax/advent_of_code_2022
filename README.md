# 🎄 Advent of Code 2022 🎄

Hello!

Maybe not up to date but I want to finish it for the first time! 

Enjoy!

# How to run?

I decided to try write all the challenges in NASM Assembly.
To make it work i created dockerfile that is ready to run the codes.

To build container simply type:

```sh
docker build -t <container_name> .
```

To run container type:
```sh
docker container run -dp <port_you_want>:22 -t <container_name>
```

Now you can connect via ssh and test all the examples:

```sh
cd advent_of_code_2022/XX-day/
nasm -f elf64 program.asm
ld program.o -o program
./program 
```

🎄 Merry code-mas! 🎄 
