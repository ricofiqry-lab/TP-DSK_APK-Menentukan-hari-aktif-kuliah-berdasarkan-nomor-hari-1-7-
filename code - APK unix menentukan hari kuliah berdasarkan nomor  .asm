.model small
.stack 100h
.data
    msgInput  db 13,10,'Masukkan nomor hari (1-7): $'
    msgSenin  db 13,10,'Hari: Senin - Hari Aktif Kuliah$'
    msgSelasa db 13,10,'Hari: Selasa - Hari Aktif Kuliah$'
    msgRabu   db 13,10,'Hari: Rabu - Hari Aktif Kuliah$'
    msgKamis  db 13,10,'Hari: Kamis - Hari Aktif Kuliah$'
    msgJumat  db 13,10,'Hari: Jumat - Hari Aktif Kuliah$'
    msgSabtu  db 13,10,'Hari: Sabtu - Hari Libur$'
    msgMinggu db 13,10,'Hari: Minggu - Hari Libur$'
    msgError  db 13,10,'Input tidak valid!$'

.code
main:
    mov ax, @data
    mov ds, ax

ULANGI:
    mov ah, 09h
    lea dx, msgInput
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'

    cmp al, 1
    je SENIN
    cmp al, 2
    je SELASA
    cmp al, 3
    je RABU
    cmp al, 4
    je KAMIS
    cmp al, 5
    je JUMAT
    cmp al, 6
    je SABTU
    cmp al, 7
    je MINGGU

    mov ah, 09h
    lea dx, msgError
    int 21h
    jmp SELESAI

SENIN:
    lea dx, msgSenin
    jmp CETAK_ULANG
SELASA:
    lea dx, msgSelasa
    jmp CETAK_ULANG
RABU:
    lea dx, msgRabu
    jmp CETAK_ULANG
KAMIS:
    lea dx, msgKamis
    jmp CETAK_ULANG
JUMAT:
    lea dx, msgJumat
    jmp CETAK_ULANG

SABTU:
    lea dx, msgSabtu
    jmp CETAK_SELESAI
MINGGU:
    lea dx, msgMinggu
    jmp CETAK_SELESAI

CETAK_ULANG:
    mov ah, 09h
    int 21h
    jmp ULANGI

CETAK_SELESAI:
    mov ah, 09h
    int 21h

SELESAI:
    mov ah, 4Ch
    int 21h
end main
