main: main.c
	gcc -o main main.c

test: main
	grep -R . /proc/sys/fs/binfmt_misc
	./main