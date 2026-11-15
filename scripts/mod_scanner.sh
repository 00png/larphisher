#!/bin/bash
read -rp "IP/Host: " h
for p in 21 22 23 25 53 80 110 443 445 1433 3306 3389 8080; do
  (echo >/dev/tcp/$h/$p) >/dev/null 2>&1 && echo -e "\033[1;37m[+] Porta $p aberta\033[0m"
done
