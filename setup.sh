#!/bin/bash
echo -e "\033[1;31m[+] Instalando dependencias do Larphisher v4...\033[0m"
apt update -y
apt install php php-curl curl wget qrencode tar netcat-traditional nmap sqlmap hydra nikto metasploit-framework apktool whiptail -y 2>/dev/null
if ! command -v cloudflared &> /dev/null; then
wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64 -O /usr/local/bin/cloudflared
chmod +x /usr/local/bin/cloudflared
fi
ln -sf ~/larphisher/larphisher.sh /usr/local/bin/larphisher
chmod +x /usr/local/bin/larphisher
chmod +x larphisher.sh scripts/*.sh
echo -e "\033[1;37m[+] Setup completo. Digite 'larphisher' no terminal.\033[0m"
