<div align="center">

# 💀 LARPHISHER v4
**Criminal Grade Framework & C2 Infrastructure**
<br>
`by-01png`

[![Kali](https://img.shields.io/badge/OS-Kali%20NetHunter-red?style=flat-square&logo=kali-linux)](https://kali.org)
[![PHP](https://img.shields.io/badge/PHP-8.2-blue?style=flat-square&logo=php)](https://php.net)
[![Bash](https://img.shields.io/badge/Shell-Bash-green?style=flat-square&logo=gnu-bash)](https://gnu.org)
[![Status](https://img.shields.io/badge/Status-Active-red?style=flat-square)]()

</div>

---

> ⚠️ **AVISO:** Este framework foi construído para operações de Red Team, Pentest e Engenharia Social. O desenvolvedor (`by-01png`) não se responsabiliza pelo uso indevido. O uso é de total responsabilidade do operador.

---

## 🚀 Features

- **Phishing Engine:** 9 templates web dinâmicos (Facebook, Instagram, Google, TikTok, etc.)
- **Payload Generator:** Integração nativa com MSFVenom (APK, EXE, ELF, Mach-O) e APK Binder.
- **C2 Listener:** Handler automático do Metasploit para gerenciamento de sessões.
- **Kali Arsenal:** Wrappers interativos para Nmap, SQLMap, Hydra, Nikto, WPScan, Bettercap e Aircrack-ng.
- **Network Tunnels:** Cloudflared, Ngrok, LocalXpose, Serveo e Chisel (Pivot).
- **OSINT & Recon:** Dorks, URL Masker, Phone Lookup, Email Pwned, QR Gen.
- **Anti-Forensics:** ZeroTrace, Obfuscador PHP (Bypass AV) e limpeza de logs.
- **Interface:** Menu interativo em Whiptail (Navegação por setas) focado em Terminal / Termux.

---

## ⚙️ Instalação (Kali NetHunter / Termux)

```bash
git clone https://github.com/00png/larphisher.git
cd larphisher
chmod +x setup.sh
bash setup.sh
O script de setup irá instalar todas as dependências: php, php-curl, nmap, sqlmap, hydra, metasploit-framework, apktool, cloudflared e outras ferramentas necessárias.

---

💻 Uso

Para iniciar o painel de controle, digite em qualquer diretório:

```bash
larphisher
```

Navegue pelas mais de 60 funções utilizando as setas ↑ ↓ do teclado e confirme com Enter.

---

📂 Estrutura

```
larphisher/
├── core/          # Módulos de captura e exfiltração PHP
├── scripts/       # Wrappers Bash (Kali tools, MSF, Tunnels)
├── sites/         # Templates de Phishing (HTML/PHP)
├── payloads/      # Saída de RATs e Backdoors
├── reports/       # Logs de Nmap e SQLMap
├── .server/www/   # Document root do servidor PHP
├── config/        # Configurações e Webhooks
└── larphisher.sh  # Entrypoint / Menu Principal
```

---

🛡️ ZeroTrace

Para limpar todas as credenciais capturadas, destruir logs de histórico e compactar os dados antes de desligar, use a opção 56 - Zero Trace no menu.

<br>
<div align="center">
  <i>"Torch lit. Building."</i><br>
  <b>by-01png</b>
</div>
