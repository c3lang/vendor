LIBDIR := ./libraries
C3C := c3c
TARGET ?=
LIB_FOLDERS := $(wildcard $(LIBDIR)/*.c3l)
LIBS := $(patsubst %.c3l,%,$(notdir $(LIB_FOLDERS)))
TARGET_ARG := $(if $(TARGET),--target $(TARGET),)

.PHONY: all list compile

all: compile

list:
	@printf '%s\n' $(LIBS)

compile:
	@for libname in $(LIBS); do \
		files=$$(find "$(LIBDIR)/$$libname.c3l" -maxdepth 2 -type f \( -name '*.c3' -o -name '*.c3i' \)); \
		if [ -z "$$files" ]; then \
			echo "Skipping $$libname (no .c3/.c3i files found)"; \
			continue; \
		fi; \
		echo "Compiling $$libname"; \
		$(C3C) -C compile $(TARGET_ARG) --libdir "$(LIBDIR)" --lib "$$libname" $$files; \
	done
