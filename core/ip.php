<?php
function lph_intel($ip){
  $u="http://ip-api.com/json/{$ip}?fields=status,country,countryCode,regionName,city,lat,lon,isp,org,as,proxy,hosting,query";
  $c=stream_context_create(['http'=>['timeout'=>3,'ignore_errors'=>true]]);
  $r=@file_get_contents($u,false,$c);
  return $r?json_decode($r,true):['query'=>$ip,'status'=>'fail'];
}
function lph_iplog($ip){
  $i=lph_intel($ip);
  $l=sprintf("[%s] %s | %s/%s | isp:%s | proxy:%d\n",date('c'),$i['query']??$ip,$i['countryCode']??'?',$i['city']??'?',$i['isp']??'?',!empty($i['proxy'])?1:0);
  @file_put_contents(__DIR__.'/../auth/ip.txt',$l,FILE_APPEND);
  return $i;
}
