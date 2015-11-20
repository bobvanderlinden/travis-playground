main: main.c
	gcc -o main main.c

test: main
	./main