ifeq ($(strip $(CC)),)
CC=g++
endif
ifeq ($(strip $(CXXFLAGS)),)
CXXFLAGS:=-Wall -fPIC
endif
ifeq ($(strip $(LIBS)),)
LIBS:=occi
endif
SRCS:=std_length.cc getString.cc
OBJS:=$(addsuffix .o,$(basename $(SRCS)))
LIBEXT:=so
ifeq ($(strip $(shell uname -s)),Darwin)
LIBEXT:=dy
endif
LIB:=libcms_oracleocci_abi_hack.$(LIBEXT)
all: $(LIB)
	@echo All Done
clean:
	rm -f $(OBJS)
	rm -f $(LIB)
%.o: %.cc
	$(CC) -c $(addprefix -I,$(INCLUDE_DIR)) $(CXXFLAGS) $< -o $@
$(LIB): $(OBJS)
	$(CC) -shared $(addprefix -L,$(LIB_DIR)) $(LDFLAGS) $(addprefix -l,$(LIBS)) $? -o $@
