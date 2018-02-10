.PHONY: all clean build_all
ifeq ($(strip $(CXX)),)
CXX:=g++
endif
ifeq ($(strip $(CXXFLAGS)),)
CXXFLAGS:=-Wall -fPIC
endif
ifeq ($(strip $(LIBS)),)
LIBS:=occi
endif
IS_CXX11_ABI:=is_cxx11_abi
all: build/bin/$(IS_CXX11_ABI)
	@$(MAKE) build_all CXX11_ABI=$$($< && echo YES || echo NO)
clean:
	rm -rf build
build/bin/$(IS_CXX11_ABI): $(IS_CXX11_ABI).cpp
	@[ -d $(@D) ] || mkdir -p $(@D)
	$(CXX) -o $@ $<
build_all: build/include/occi.h
ifeq ($(strip $(CXX11_ABI)),YES)
SRCS:=$(wildcard *.cc)
OBJS:=$(addprefix build/objs/,$(addsuffix .o,$(basename $(SRCS))))
LIBEXT:=so
ifeq ($(strip $(shell uname -s)),Darwin)
LIBEXT:=dy
endif
LIB:=libcms_oracleocci_abi_hack.$(LIBEXT)
build/objs/%.o: %.cc $(OCCI_HEADER)
	@[ -d $(@D) ] || mkdir -p $(@D)
	$(CXX) -c -I./build/include $(addprefix -I,$(INCLUDE_DIR)) $(CXXFLAGS) $< -o $@
build/lib/$(LIB): $(OBJS)
	@[ -d $(@D) ] || mkdir -p $(@D)
	$(CXX) -shared $(addprefix -L,$(LIB_DIR)) $(LDFLAGS) $(addprefix -l,$(LIBS)) $? -o $@
build/include/occi.h: cms_oracleocci_cxx11_abi.h build/lib/$(LIB)
	@[ -d $(@D) ] || mkdir -p $(@D)
	@cp $< $@
else
build/include/occi.h: cms_oracleocci_old_abi.h
	@[ -d $(@D) ] || mkdir -p $(@D)
	@cp $< $@
endif
