#!/bin/bash
read -rp "Número (DDD+Número): " num
for i in {1..10}; do
  curl -s -X POST "https://api.textbelt.com/api/v1/sms" -H "Content-Type: application/json" -d "{\"to\":\"$num\",\"message\":\"Codigo: 1234\"}" >/dev/null
  echo -e "\033[1;31m[+] SMS $i enviado\033[0m"
  sleep 2
done
