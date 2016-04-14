# minimalist makefile
.SUFFIXES:
#
.SUFFIXES: .cpp .o .c .h
ifeq ($(DEBUG),1)
CFLAGS = -fPIC  -std=c99 -ggdb -msse4.1 -march=native -Wall -Wextra -Wshadow -fsanitize=undefined  -fno-omit-frame-pointer -fsanitize=address
else
CFLAGS = -fPIC -std=c99 -O3 -msse4.1  -march=native -Wall -Wextra -Wshadow
endif # debug
all:  unit 
test:
	./unit

HEADERS=./include/fastdelta.h 

OBJECTS= fastdelta.o

fastdelta.o: ./src/fastdelta.c $(HEADERS)
	$(CC) $(CFLAGS) -c ./src/fastdelta.c -Iinclude

example: ./example.c    $(HEADERS) $(OBJECTS)
	$(CC) $(CFLAGS) -o example ./example.c -Iinclude  $(OBJECTS)

unit: ./tests/unit.c    $(HEADERS) $(OBJECTS)
	$(CC) $(CFLAGS) -o unit ./tests/unit.c -Iinclude  $(OBJECTS)
clean:
	rm -f unit *.o example 
