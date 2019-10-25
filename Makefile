SRC = $(wildcard *.hs)
HDR = $(SRC:.hs=.hi)
OBJ = $(SRC:.hs=.o)
EXE = "Main"

all:
	ghc --make -Wall $(SRC)
	./$(EXE)
	rm $(HDR) $(OBJ) $(EXE)
