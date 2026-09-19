JMP start
NOP
oem_id DB "PHYSSOFS"
bps DW 512
spc DB 1
rv_s DW 1
num_fat DB 2
r_entries DW 224
total_sector DW 50
media_despt DB 0xf0
spfat DW 2
sptack DW 12
num_head DW 2
hidden_sector DW 0,0
large_total_sectors DW 0,0
drive_number DB 0
reserved DB 1
boot_signature DB 0x29
volume_serial_number DQ 0xbbaaccdd
volume_label DB "MY_PHY_DISK"
file_system_type DB "FAT12   "


start:
    HLT


TIMES 510-($-$$) DB 0
DW 0xaa55
TIMES 25088 DB 0
