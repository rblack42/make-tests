CXX = g++
ifeq ($(OS), Windows_NT)
    include mk/pc/wintools.mk
    TARGET  = win$(PROJNAME)$(EXT)
    PREFIX = 
	PLATFORM = Windows
	CXX - g++
else
    include mk/mac/mactools.mk
    TARGET  = $(PROJNAME)
    PREFIX = ./
	PLATFORM = Mac
endif

include mk/debug.mk
include mk/cppproj.mk
include mk/cppgraphics.mk
include mk/cpplint.mk
include mk/help.mk

all: $(TARGET) ## build primary application

