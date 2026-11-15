#!/bin/bash
T="$1"
read -rp "Porta local [8080]: " P; P="${P:-8080}"
echo -e "\033[1;31m[+] Iniciando $T na porta $P\033[0m"
case "$T" in
  cloudflared) command -v cloudflared >/dev/null || { wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64 -O /usr/local/bin/cloudflared && chmod +x /usr/local/bin/cloudflared; }; cloudflared tunnel --url "http://127.0.0.1:$P" ;;
  ngrok) ngrok http $P ;;
  localxpose) localxpose tunnel http 127.0.0.1:$P ;;
  serveo) ssh -R 80:localhost:$P serveo.net ;;
  chisel) echo "Use: ./chisel server -p 8080 --reverse" ;;
esac
