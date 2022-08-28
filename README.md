# DDK_variables_in_Makefile
To introduce variables in Makefile.

# Let us get started
Refer to "6.10 Variables from the Environment" below. </br>
Every environment variable that make sees when it starts up is transformed into a make variable with the same name and value. </br>

## Method 1
Use the variable directly in Makefile. </br>

```sh
VAR_ENABLE = y

ifeq ($(VAR_ENABLE), y)
	CC := gcc
	program := helloworld
	objects := helloworld.o
endif

$(program) : $(objects)
	$(CC) -o $(program) $(objects) 
	@echo "__Make Enable__";
```
![Screen Shot 2022-08-28 at 1 10 34 PM](https://user-images.githubusercontent.com/67073582/187058571-592a8ce7-48ea-4a5c-8750-23e7ad447425.png)

## Method 2
Export the variable in the same shell. </br>

```sh
ifeq ($(VAR_ENABLE), y)
	CC := gcc
	program := helloworld
	objects := helloworld.o
endif

$(program) : $(objects)
	$(CC) -o $(program) $(objects) 
	@echo "__Make Enable__";
```
![Screen Shot 2022-08-28 at 1 00 09 PM](https://user-images.githubusercontent.com/67073582/187058298-dafaf26d-6bdc-41c0-837b-d19b53119d70.png)

## Method 3
Append the variable to "make". </br>

```sh
ifeq ($(VAR_ENABLE), y)
	CC := gcc
	program := helloworld
	objects := helloworld.o
endif

$(program) : $(objects)
	$(CC) -o $(program) $(objects) 
	@echo "__Make Enable__";
```
![Screen Shot 2022-08-28 at 1 03 00 PM](https://user-images.githubusercontent.com/67073582/187058418-4aedc722-1eda-45f1-92b8-ec707bb0a632.png)

# CFLAGS
"CFLAGS += -D[]" is equal to "#define []".

```sh
CFLAGS += -D__DEBUG__

ifeq ($(VAR_ENABLE), y)
	CC := gcc
	program := helloworld
	objects := helloworld.o
endif

$(program) : $(objects)
	$(CC) -o $(program) $(CFLAGS) $(objects) 
	@echo "__Make Enable__";
```
```c
#include<stdio.h>

int main(){

#ifdef __DEBUG__
  printf("Hello World\n");
#else
  printf("__DEBUG__ disappear.\n");
#endif
  
  return 0;
}
```
![Screen Shot 2022-08-28 at 8 22 59 PM](https://user-images.githubusercontent.com/67073582/187074001-87cf85aa-ef65-4e15-bf51-eb6938da97bb.png)

# References
1. https://www.gnu.org/software/make/manual/make.html
