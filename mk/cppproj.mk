TSTTGT	:= testapp

USRCS   := $(wildcard src/*.cpp)
LSRCS   := $(wildcard lib/*.cpp)
TSRCS	:= $(wildcard tests/*.cpp)

UOBJS   := $(USRCS:.cpp=.o)
LOBJS   := $(LSRCS:.cpp=.o)
TOBJS	:= $(TSRCS:.cpp=.o)

OBJS    := $(UOBJS) $(LOBJS) $(TOBJS)
DEPS	:= $(OBJS:.o=.d)

CXXFLAGS    = -Iinclude -std=c++11
LFLAGS		=

$(TARGET):  $(UOBJS) $(LOBJS)
	$(CXX) -o $@ $^ $(LFLAGS)

$(TSTTGT):	$(TOBJS) $(LOBJS)
	$(CXX) -o $@ $^ $(LFLAGS)

%.o:    %.cpp
	$(CXX) -c -o $@ $< $(CXXFLAGS)

%.d:	%.cpp
	$(CXX) $(CXXFLAGS) -MM -MT $@ -MF $@ $<

.PHONY: run ## run primary application
run: $(TARGET)
	@$(PREFIX)$(TARGET)

.PHONY:	test
test: $(TSTTGT) 	## run unit tests
	@$(PREFIX)$(TSTTGT)

.PHONY: clean ## remove all build artifacts
clean:
	$(RM) $(DOBJS) $(TARGET) $(TSTTGT) $(DEPS)

-include $(DEPS)
