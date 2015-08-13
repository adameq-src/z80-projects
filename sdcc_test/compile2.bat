sdcc -mz80 --code-loc 0x0000 --data-loc 0x4000 --no-std-crt0 z80system.c
sdcc -mz80 --code-loc 0x0000 --data-loc 0x4000 --no-std-crt0 z80lcd.c
sdcc -mz80 --code-loc 0x0000 --data-loc 0x4000 --no-std-crt0 z80sio.c
sdcc -mz80 --code-loc 0x0000 --data-loc 0x4000 --no-std-crt0 test.c z80system.rel z80lcd.rel z80sio.rel
packihx test.ihx>test.hex
