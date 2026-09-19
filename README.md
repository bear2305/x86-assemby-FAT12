# x86-assemby-FAT12
 Building a FAT12 Filesystem Boot Sector From Scratch — No mkfs.fat Required


---


# Custom x86 FAT12 Bootloader

A lightweight x86 assembly implementation of a custom FAT12 bootloader designed for legacy BIOS systems. This project sets up the Bios Parameter Block (BPB) required for FAT12 file system compatibility and demonstrates basic boot sector initialization.

---

## 🛠️ Technical Details

- **Architecture:** x86 (16-bit Real Mode)
- **Assembler:** NASM (Netwide Assembler)
- **Target File System:** FAT12
- **Boot Sector Size:** 512 Bytes (padded with magic boot signature `0xAA55`)

---

## 📄 Boot Sector Memory Layout & BPB

The program defines a custom Bios Parameter Block (BPB) to allow disk tools and operating systems to recognize the media as a valid FAT12 volume:

| Structure Field | Value / Setting | Description |
| :--- | :--- | :--- |
| **OEM ID** | `"PHYSSOFS"` | System identifier |
| **Bytes per Sector** | `512` | Standard sector size |
| **Sectors per Cluster** | `1` | Single-sector clusters |
| **Reserved Sectors** | `1` | Boot sector area |
| **FAT Copies** | `2` | Primary & backup file allocation tables |
| **Root Entries** | `224` | Max root directory entries |
| **Media Descriptor** | `0xF0` | 3.5" HD Floppy standard |
| **Volume Label** | `"MY_PHY_DISK"` | Volume name |
| **File System Type** | `"FAT12   "` | Extended boot signature type |

---

## 🚀 Getting Started

### Prerequisites

You need **NASM** (to assemble the code) and **QEMU** (to run the bootable image).

#### On Debian/Ubuntu:
bash
sudo apt update
sudo apt install nasm qemu-system-x86



---

## ⚙️ Building & Running

### 1. Assemble the Source Code

Compile `test.asm` into a raw binary file using NASM:

```bash
nasm -f bin test.asm -o boot.bin

```

### 2. Test in QEMU Virtual Machine

Run your compiled binary image directly in QEMU:

```bash
qemu-system-i386 -fda boot.bin

```

---

## 📂 Project Structure

```text
.
├── test.asm        # Main x86 assembly source file containing BPB and entry point
└── README.md       # Project documentation

```

---

## 💡 Code Overview

```nasm
JMP start
NOP

; BIOS Parameter Block (BPB) Configuration
oem_id               DB "PHYSSOFS"
bps                  DW 512
spc                  DB 1
...

start:
    HLT              ; Halt processor execution

; Boot Signature & Padding
TIMES 510-($-$$) DB 0
DW 0xaa55            ; Magic boot loader signature
TIMES 25088 DB 0    ; Reserved disk space padding


---

## 📜 License

This project is open-source and available under the [MIT License](https://www.google.com/search?q=LICENSE&utm_source=gemini).

```

```
