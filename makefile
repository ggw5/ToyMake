CC := g++
CFLAGS := -std=c++11 -O3 -g3
INCLUDE := -I./include

SRC_PATH := ./src
OBJ_PATH := ./obj
SRC := $(wildcard $(SRC_PATH)/*.cpp)
OBJ := $(patsubst %.cpp,$(OBJ_PATH)/%.o,$(notdir $(SRC)))
#$(info SRC is $(SRC))
#$(info OBJ is $(OBJ))

MAIN := test

all: $(MAIN)

$(MAIN): $(OBJ)
	$(CC) -o $(MAIN) $^

$(OBJ_PATH)/%.o: $(SRC_PATH)/%.cpp
	$(CC) -c $(CFLAGS) $(INCLUDE) $< -o $@


clean:
	rm -f $(OBJ) $(MAIN)
