run: link
	@./bin/main

link: build
	@ld obj/* -o bin/main

build:
	@as src/main.S -o obj/main.o
