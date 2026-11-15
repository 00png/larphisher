#!/bin/bash
echo -e "\033[1;31m[+] Simulador de Ransomware (by-01png)\033[0m"
read -rp "Diretorio alvo (ex: /sdcard/test): " dir
mkdir -p "$dir/test_files"
for i in {1..5}; do echo "Dados confidenciais $i" > "$dir/test_files/doc_$i.txt"; done
echo "Criptografando..."
for f in "$dir/test_files/"*.txt; do
  openssl enc -aes-256-cbc -salt -in "$f" -out "$f.locked" -k "by01png" 2>/dev/null
  rm "$f"
done
echo "SUA REDE FOI COMPROMETIDA. PAGUE 1 BTC. by-01png" > "$dir/LEIA_ISSO.txt"
echo -e "\033[1;37m[+] Simulação concluída.\033[0m"
