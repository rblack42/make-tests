ifeq ($(OS), Windows_NT)
    include mk/pc/wintools.mk
    TARGET  = win$(PROJNAME)$(EXT)
    PREFIX = 
else
    include mk/mac/mactools.mk
    TARGET  = $(PROJNAME)
    PREFIX = ./
endif

include mk/cppproj.mk
