#VAR_ENABLE = y

ifeq ($(VAR_ENABLE), y)
	CC := gcc
	program := helloworld
	objects := helloworld.o
endif

$(program) : $(objects)
	$(CC) -o $(program) $(objects) 
	@echo "__Make Enable__";
