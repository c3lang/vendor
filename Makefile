LIBDIR := ./libraries
C3C := c3c
TARGET ?=
TARGET_ARG := $(if $(TARGET),--target $(TARGET),)

LIB_FOLDERS := $(wildcard $(LIBDIR)/*.c3l)
LIBS := $(patsubst %.c3l,%,$(notdir $(LIB_FOLDERS)))

.PHONY: all list $(LIBS)

all: $(LIBS)

list:
	@printf '%s\n' $(LIBS)

$(LIBS):
	@files=$$(find "$(LIBDIR)/$@.c3l" -type f \( -name '*.c3' -o -name '*.c3i' \) | sort); \
	if [ -z "$$files" ]; then \
		echo "Skipping $@ (no .c3/.c3i files found)"; \
		exit 0; \
	fi; \
	echo "Compiling $@"; \
	$(C3C) -C compile $(TARGET_ARG) --libdir "$(LIBDIR)" --lib "$@" $$files || exit 1
