CC := g++
CFLAGS := -std=c++11 -O3 -g3
INCLUDE := -I./include

SRC_PATH := ./src
OBJ_PATH := ./obj
OBJ := $(patsubst $(SRC_PATH)/%.c, $(OBJ_PATH)/%.o, $(wildcard $(SRC_PATH)/*.c)) \
       $(patsubst $(SRC_PATH)/%.cpp, $(OBJ_PATH)/%.o, $(wildcard $(SRC_PATH)/*.cpp))

#$(info OBJ is $(OBJ))

MAIN := test

all: $(MAIN)

$(MAIN): $(OBJ)
	$(CC) -o $(MAIN) $^

$(OBJ_PATH)/%.o: $(SRC_PATH)/%.c
	$(CC) -c $(CFLAGS) $(INCLUDE) $< -o $@

$(OBJ_PATH)/%.o: $(SRC_PATH)/%.cpp
	$(CC) -c $(CFLAGS) $(INCLUDE) $< -o $@

clean:
	rm -f $(OBJ) $(MAIN)
