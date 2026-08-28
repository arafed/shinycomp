# --- Configuration ---
# Device type (e.g., g16v8, g22v10, g20v8)
DEVICE     ?= ATF16V8B

# Input file name without extension
TARGET     ?= sevenseg

# --- Tools ---
GALASM     = galasm
MINIPRO    = minipro

# --- Rules ---
.PHONY: all clean burn

# Default target: compile only
all: $(TARGET).jed burn

# Compile .pld to .jed
$(TARGET).jed: $(TARGET).pld
	$(GALASM) $<

# Burn the fuse map to the chip
burn: $(TARGET).jed
	$(MINIPRO) -p "$(DEVICE)" -w $<

# Remove generated compiler artifacts
clean:
	rm -f $(TARGET).jed $(TARGET).chp $(TARGET).pin $(TARGET).fuse

