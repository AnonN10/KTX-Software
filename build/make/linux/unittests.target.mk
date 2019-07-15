# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := unittests
DEFS_Debug := \
	'-DDEBUG' \
	'-D_DEBUG'

# Flags passed to all source files.
CFLAGS_Debug := \
	-pedantic \
	-Og \
	-g

# Flags passed to only C files.
CFLAGS_C_Debug := \
	-std=c99

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-std=c++11

INCS_Debug := \
	-I$(srcdir)/tests/gtest/include \
	-I$(srcdir)/lib \
	-I$(srcdir)/include \
	-I$(srcdir)/other_include

DEFS_Release := \
	'-DNDEBUG'

# Flags passed to all source files.
CFLAGS_Release := \
	-pedantic \
	-O3

# Flags passed to only C files.
CFLAGS_C_Release := \
	-std=c99

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-std=c++11

INCS_Release := \
	-I$(srcdir)/tests/gtest/include \
	-I$(srcdir)/lib \
	-I$(srcdir)/include \
	-I$(srcdir)/other_include

OBJS := \
	$(obj).target/$(TARGET)/tests/unittests/unittests.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# Make sure our dependencies are built before any of us.
$(OBJS): | $(obj).target/libgtest.a $(obj).target/libgtest_main.a $(builddir)/lib.target/libktx.gl.so $(obj).target/libktx.gl.so

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-g \
	-Wl,-rpath=\$$ORIGIN/lib.target/ \
	-Wl,-rpath-link=\$(builddir)/lib.target/

LDFLAGS_Release := \
	-Wl,-rpath=\$$ORIGIN/lib.target/ \
	-Wl,-rpath-link=\$(builddir)/lib.target/

LIBS :=

$(builddir)/unittests: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(builddir)/unittests: LIBS := $(LIBS)
$(builddir)/unittests: LD_INPUTS := $(OBJS) $(obj).target/libgtest.a $(obj).target/libgtest_main.a $(obj).target/libktx.gl.so
$(builddir)/unittests: TOOLSET := $(TOOLSET)
$(builddir)/unittests: $(OBJS) $(obj).target/libgtest.a $(obj).target/libgtest_main.a $(obj).target/libktx.gl.so FORCE_DO_CMD
	$(call do_cmd,link)

all_deps += $(builddir)/unittests
# Add target alias
.PHONY: unittests
unittests: $(builddir)/unittests

# Add executable to "all" target.
.PHONY: all
all: $(builddir)/unittests

