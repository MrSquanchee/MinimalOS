[org 0x7c00]
	mov [BOOT_DRIVE], dl
	mov bp, 0x8000
	mov sp, bp

	mov bx, 0x9000
	mov dh, 0x02
	mov dl, [BOOT_DRIVE]
	call disk_load

	mov dx, [0x9000]
	call print_hex

	mov dx, [0x9000 + 512]
	call print_hex

	jmp $

%include "print.asm"
%include "read_disk.asm"

BOOT_DRIVE: db 0
MSG: db "Debug", 0
times 510 - ($ - $$) db 0
dw 0xaa55

times 256 dw 0xabcd
times 256 dw 0x3456