# COMPILER FLAGS
#CC=gcc
NAME=main
CFLAGS=-lwinmm

# DIRS
INCLUDE=include
SOURCE=src
DIST=build

_DEPS = 
DEPS = $(patsubst %,$(INCLUDE)/%,$(_DEPS))

_OBJ = main.o
OBJ = $(patsubst %,$(DIST)/%,$(_OBJ))

_build_dir_creation := $(shell mkdir $(DIST))

$(DIST)/%.o: $(SOURCE)/%.cpp $(DEPS)
		$(CXX) -c -o $@ $< -I$(SOURCE) -I$(INCLUDE)

all: $(OBJ)
	$(CXX) -o $(NAME) $^ $(CFLAGS)

debug: $(OBJ)
	$(CXX) -g -o $(DIST)/$(NAME) $^ $(CFLAGS)

.PHONY: clean

clean:
	del $(DIST)\*.o /Q /F /S
	del $(NAME).exe /Q