sdcc -mz80 --code-loc 0x0000 --data-loc 0x4000 --no-std-crt0 -Iinc src\z80system.c
sdcc -mz80 --code-loc 0x0000 --data-loc 0x4000 --no-std-crt0 -Iinc src\z80lcd.c z80system.rel
sdcc -mz80 --code-loc 0x0000 --data-loc 0x4000 --no-std-crt0 -Iinc src\z80sio.c z80system.rel
sdcc -mz80 --code-loc 0x0000 --data-loc 0x4000 --no-std-crt0 -Iinc src\terminal.c z80system.rel z80lcd.rel z80sio.rel
packihx terminal.ihx>terminal.hex
