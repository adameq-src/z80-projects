sdcc -mz80 --code-loc 0x0000 --data-loc 0x4000 --no-std-crt0 test.c
packihx test.ihx>test.hex
