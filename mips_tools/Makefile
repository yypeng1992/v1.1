ifndef CROSS_COMPILE
CROSS_COMPILE=/usr/bin/mips-linux-gnu-
endif
CC      = $(CROSS_COMPILE)as
LD      = $(CROSS_COMPILE)ld
READELF = $(CROSS_COMPILE)readelf
OBJCOPY = $(CROSS_COMPILE)objcopy
OBJDUMP = $(CROSS_COMPILE)objdump

SCRIPT  = ram.ld
OBJECTS = inst_rom.o

export CROSS_COMPILE

# ****************************
# Rules
# ****************************
all: inst_rom.data

bin: inst_rom.bin

%.o: %.S
	$(CC) -mips32 $< -o $@

inst_rom.om: $(SCRIPT) $(OBJECTS)
	$(LD) -T $(SCRIPT) $(OBJECTS) -o $@

inst_rom.bin: inst_rom.om
	$(OBJCOPY) -O binary $< $@ --only-section=.text

inst_rom.data: inst_rom.bin
	./Bin2Mem.pl -bin $< -mem $@

clean:
	rm -f *.o *.om *.bin

clean-all:
	rm -f *.o *.om *.bin *.data
