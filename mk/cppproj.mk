USRCS   := $(wildcard src/*.cpp)
LSRCS   := $(wildcard lib/*.cpp)

UOBJS   := $(USRCS:.cpp=.o)
LOBJS   := $(LSRCS:.cpp=.o)

OBJS    := $(UOBJS) $(LOBJS) $(TOBJS)

CXXFLAGS    = -Iinclude -std=c++11

$(TARGET):  $(UOBJS) $(LOBJS)
	$(CXX) -o $@ $^

%.o:    %.cpp
	$(CXX) -c -o $@ $< $(CXXFLAGS)

.PHONY: run
run: $(TARGET)
	@$(PREFIX)$(TARGET)

.PHONY: clean
clean:
	$(RM) $(DOBJS) $(TARGET)
