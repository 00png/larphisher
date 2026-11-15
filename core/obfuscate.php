<?php
if($argc<2)exit(1);
$s=file_get_contents($argv[1]);
$s=preg_replace('/^\s*<\?php/','',$s);$s=preg_replace('/\?>\s*$/','',$s);
$b=base64_encode(gzdeflate($s,9));
file_put_contents($argv[1],"<?php \$l0=base64_decode('{$b}');eval('?>'.gzinflate(\$l0));");
echo "Obfuscated!\n";
