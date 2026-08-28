# --- Configuration ---
# Device type (e.g., g16v8, g22v10, g20v8)
DEVICE     ?= AT28C64B

# Input file name without extension
TARGET     ?= rom

# --- Tools ---
MINIPRO    = minipro

# --- Rules ---
.PHONY: all clean compile link burn

# Default target: compile only
all: rom.o rom.bin

# Compile .asm to .o
$(TARGET).o: $(TARGET).asm
	ca65 $< -o $(TARGET).o -l $(TARGET).list

$(TARGET).bin: $(TARGET).o
	ld65 -C rom.cfg $< -o $(TARGET).bin

# Burn the fuse map to the chip
burn: $(TARGET).bin
	$(MINIPRO) -p "$(DEVICE)" -w $<

# Remove generated compiler artifacts
clean:
	rm -f $(TARGET).o $(TARGET).bin $(TARGET).map

read:
	$(MINIPRO) -p "$(DEVICE)" -r read.bin
