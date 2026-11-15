#!/bin/bash
T="$1"
case "$T" in
  dork) read -rp "Dominio: " d; echo "site:$d ext:sql"; echo "site:$d inurl:admin"; echo "site:$d filetype:env" ;;
  masker) read -rp "URL real: " dst; read -rp "URL falsa: " fake; echo -e "\033[1;37m$fake@$dst\033[0m" ;;
  shortener) read -rp "URL: " u; curl -s -G "https://tinyurl.com/api-create.php" --data-urlencode "url=$u"; echo ;;
  qr) read -rp "URL: " u; qrencode -t ANSIUTF8 "$u" ;;
  phone) read -rp "Numero: " n; echo "https://wa.me/$n" ;;
  email) read -rp "Email: " e; echo "https://haveibeenpwned.com/account/$e" ;;
  user) read -rp "User: " u; curl -s "https://api.github.com/users/$u" | grep '"id"' ;;
  dns) read -rp "Dominio: " d; dig "$d" ANY +short ;;
esac
