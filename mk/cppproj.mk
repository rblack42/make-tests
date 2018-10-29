USRCS   := $(wildcard src/*.cpp)
UOBJS   := $(USRCS:.cpp=.o)

OBJS    := $(UOBJS) $(LOBJS) $(TOBJS)

$(TARGET):  $(UOBJS)
	$(CXX) -o $@ $^

%.o:    %.cpp
	$(CXX) -c -o $@ $<

.PHONY: run
run: $(TARGET)
	@$(PREFIX)$(TARGET)

.PHONY: clean
clean:
	$(RM) $(DOBJS) $(TARGET)
