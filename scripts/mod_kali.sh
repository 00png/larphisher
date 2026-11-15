#!/bin/bash
T="$1"
case "$T" in
  nmap_full) read -rp "Alvo: " t; nmap -sV -sC -A -T4 "$t" -oN "$R/reports/nmap_$t.txt" ;;
  nmap_vuln) read -rp "Alvo: " t; nmap --script vuln "$t" -oN "$R/reports/vuln_$t.txt" ;;
  sqlmap) read -rp "URL: " u; sqlmap -u "$u" --batch --dbs ;;
  hydra) read -rp "IP: " i; read -rp "Serviço: " s; read -rp "User: " u; read -rp "Wordlist: " w; hydra -l "$u" -P "$w" "$i" "$s" ;;
  nikto) read -rp "URL: " u; nikto -h "$u" ;;
  wpscan) read -rp "URL: " u; wpscan --url "$u" --enumerate u ;;
  sublist3r) read -rp "Dominio: " d; sublist3r -d "$d" ;;
  searchsploit) read -rp "Termo: " t; searchsploit "$t" ;;
  set) setoolkit ;;
  bettercap) bettercap -iface wlan0 ;;
  aircrack) read -rp "Interface (wlan0): " i; airmon-ng start "$i"; airodump-ng "${i}mon" ;;
esac
