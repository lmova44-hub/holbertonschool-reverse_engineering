#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <elf_file>"
    exit 1
fi

file_name="$1"
source ./messages.sh

# 2>/dev/null əlavə edirik ki, readelf-in xəbərdarlıqları ekrana çıxmasın
magic_number=$(readelf -h "$file_name" 2>/dev/null | grep "Magic:" | cut -c 10-)
class=$(readelf -h "$file_name" 2>/dev/null | awk '/Class:/ {print $2}')
byte_order=$(readelf -h "$file_name" 2>/dev/null | awk '/Data:/ {print $2, $3, $4}')
entry_point_address=$(readelf -h "$file_name" 2>/dev/null | awk '/Entry point address:/ {print $4}')

display_elf_header_info
