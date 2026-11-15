#!/bin/bash
read -rp "APK original: " apk
read -rp "Payload APK: " pay
read -rp "Saida: " out
apktool d -f "$apk" -o /tmp/lph_bind
cp "$pay" /tmp/lph_bind/assets/payload.apk
apktool b /tmp/lph_bind -o "$out"
echo -e "\033[1;37m[+] Binded: $out\033[0m"
