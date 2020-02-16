ifndef CROSS_COMPILE
CROSS_COMPILE=/usr/bin/mips-linux-gnu-
endif
CC      = $(CROSS_COMPILE)as
LD      = $(CROSS_COMPILE)ld
READELF = $(CROSS_COMPILE)readelf
OBJCOPY = $(CROSS_COMPILE)objcopy
OBJDUMP = $(CROSS_COMPILE)objdump

SCRIPT  = ram.ld
OBJECT  = inst_rom

export CROSS_COMPILE

# ****************************
# Rules
# ****************************
all: $(OBJECT).data

%.o: %.S
	$(CC) -mips32 $< -o $@

%.om: $(SCRIPT) %.o
	$(LD) -T $(SCRIPT) $(OBJECT).o -o $@

%.bin: %.om
	$(OBJCOPY) -O binary $< $@ --only-section=.text

%.data: %.bin
	./Bin2Mem.pl -bin $< -mem $@

clean:
	rm -f *.o *.om *.bin

clean-all:
	rm -f *.o *.om *.bin *.data
