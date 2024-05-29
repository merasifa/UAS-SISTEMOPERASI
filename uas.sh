#!/bin/bash

#UAS SISTEM OPERASI
#Nama : Tiara Mera Sifa
#NIM  : 2341720247
#Kelas: 1B - 27

# Membuat direktori baru
create_directory() {
    echo "Masukkan nama direktori baru:"
    read directory_name
    mkdir "$directory_name"
    echo "Direktori '$directory_name' telah berhasil dibuat."
}

# Membuat file baru
create_file() {
    echo "Masukkan nama file baru:"
    read file_name
    touch "$file_name"
    echo "File '$file_name' telah berhasil dibuat."
}

# Menyalin file
copy_file() {
    echo "Masukkan nama file yang akan disalin:"
    read source_file
    echo "Masukkan nama tujuan file yang baru:"
    read destination_file
    cp "$source_file" "$destination_file"
    echo "File '$source_file' telah berhasil disalin menjadi '$destination_file'."
}

# Menghapus file
delete_file() {
    echo "Masukkan nama file yang akan dihapus:"
    read file_name

    if [ -f "$file_name" ]; then
        rm "$file_name"
        echo "File '$file_name' telah berhasil dihapus."
    else
        echo "File '$file_name' tidak ditemukan."
    fi
}

# Membaca isi file
read_file() {
    echo "Masukkan nama file yang akan dibaca:"
    read file_name

    if [ -f "$file_name" ]; then
        echo "Isi dari file '$file_name':"
        cat "$file_name"
    else
        echo "File '$file_name' tidak ditemukan."
    fi
}

# Melihat isi direktori
list_directory() {
    echo "Masukkan nama direktori yang akan dilihat isinya:"
    read directory_name

    if [ -d "$directory_name" ]; then
        echo "Isi dari direktori '$directory_name':"
        ls "$directory_name"
    else
        echo "Direktori '$directory_name' tidak ditemukan."
    fi
}

# Mengubah nama file
rename_file() {
    echo "Masukkan nama file yang akan diubah:"
    read old_name
    echo "Masukkan nama file baru:"
    read new_name

    if [ -f "$old_name" ]; then
        mv "$old_name" "$new_name"
        echo "File '$old_name' telah berhasil diubah namanya menjadi '$new_name'."
    else
        echo "File '$old_name' tidak ditemukan."
    fi
}

# Memindahkan file
move_file() {
    echo "Masukkan nama file yang akan dipindahkan:"
    read file_name
    echo "Masukkan direktori tujuan:"
    read destination_directory

    if [ -f "$file_name" ]; then
        if [ -d "$destination_directory" ]; then
            mv "$file_name" "$destination_directory"
            echo "File '$file_name' telah berhasil dipindahkan ke direktori '$destination_directory'."
        else
            echo "Direktori '$destination_directory' tidak ditemukan."
        fi
    else
        echo "File '$file_name' tidak ditemukan."
    fi
}

# Mengubah izin file
change_permissions() {
    echo "Masukkan nama file atau direktori yang izinnya akan diubah:"
    read file_name
    echo "Masukkan izin baru (misalnya 755):"
    read permissions

    if [ -e "$file_name" ]; then
        chmod "$permissions" "$file_name"
        echo "Izin untuk '$file_name' telah diubah menjadi '$permissions'."
    else
        echo "File atau direktori '$file_name' tidak ditemukan."
    fi
}

# Menu utama
main_menu() {
    while true; do
        echo "===== MeraFS ====="
        echo "Pilihan:"
        echo "1. Buat direktori"
        echo "2. Buat file"
        echo "3. Salin file"
        echo "4. Hapus file"
        echo "5. Baca file"
        echo "6. Lihat isi direktori"
        echo "7. Ubah nama file"
        echo "8. Pindah file"
        echo "9. Ubah izin file"
        echo "10. Keluar"


        read choice

        case $choice in
            1) create_directory ;;
            2) create_file ;;
            3) copy_file ;;
            4) delete_file ;;
            5) read_file ;;
            6) list_directory ;;
            7) rename_file ;;
            8) move_file ;;
            9) change_permissions ;;
            10) echo "Terima kasih telah menggunakan program manajemen file." ; exit ;;
            *) echo "Pilihan tidak valid. Silakan masukkan pilihan yang benar." ;;
        esac
    done
}

# Menampilkan menu utama
main_menu
