#!/data/data/com.termux/files/usr/bin/bash

G='\e[1;32m'
W='\e[1;37m'
D='\e[90m'
LG='\e[1;92m'
R='\e[1;31m'
N='\e[0m'

loading() {
    text=$1
    for i in {1..3}; do
        echo -ne "\r ${G}●${N} ${W}$text${N} ${D}.[${i}]${N}"
        sleep 0.4
    done
    echo -ne "\r ${G}✔${N} ${W}$text berhasil${N}        \n"
}

progress_bar() {
    echo -ne " ${G}["
    for i in {1..20}; do
        echo -ne "#"
        sleep 0.05
    done
    echo -e "]${N}"
}

fake_hack() {
    clear
    echo -e "${G}╔══════════════════════════════════════════════╗${N}"
    echo -e "║        ${LG}WHATSAPP BADAK ENGINE${N}              ║"
    echo -e "${G}╚══════════════════════════════════════════════╝${N}"
    echo ""

    loading "Menghubungkan ke server WhatsApp"
    loading "Menginisialisasi sesi terenkripsi"
    loading "Bypass limit keamanan"
    loading "Injecting payload system"

    echo ""
    echo -e " ${G}●${N} ${W}Proses sinkronisasi...${N}"
    progress_bar

    echo -e "\n ${LG}SYSTEM READY ✔${N}"
    sleep 1
}

if [ ! -d "node_modules/ai" ] || [ ! -d "node_modules/firebase-admin" ]; then
    fake_hack
    echo -e "\n ${G}●${N} ${W}Menginstall core module...${N}"
    npm install @whiskeysockets/baileys ai @ai-sdk/google firebase-admin pino chalk@4.1.2 figlet --no-bin-links
    echo -e " ${G}✔${N} ${W}Install selesai${N}"
    sleep 2
fi

while true; do
    clear

    echo -e "${G}╔══════════════════════════════════════════════════════╗${N}"
    echo -e "║        ${LG}WHATSAPP BADAK ENGINE${N} ${W}v1.0${N}              ║"
    echo -e "║   ${D}High Performance WhatsApp Automation System${N}     ║"
    echo -e "${G}╚══════════════════════════════════════════════════════╝${N}"
    echo ""

    echo -e " ${G}[01]${N} ${W}Aktivasi Mode Turbo${N}"
    echo -e " ${G}[02]${N} ${W}Buat Profil WhatsApp${N}"
    echo -e " ${G}[03]${N} ${W}Auto-Pilot 24/7${N}"
    echo -e " ${G}[04]${N} ${W}Monitor Sistem${N}"
    echo ""
    echo -e " ${G}[05]${N} ${W}Hapus Profil${N}"
    echo -e " ${G}[06]${N} ${W}Factory Reset${N}"
    echo -e " ${D}[00] Keluar${N}"
    echo ""

    echo -e "${G}──────────────────────────────────────────────────────${N}"
    echo -ne " ${W}Pilih Menu${N} ${G}>>${N} "
    read menu

    case $menu in
        1)
            fake_hack
            echo -ne "\n ${W}Masukkan nomor (628xxx): ${N}"
            read nomor_blast
            node Blast_enc.js "$nomor_blast"
            read -p "Tekan Enter..."
            ;;
        2)
            fake_hack
            echo -ne "\n ${W}Nama profil: ${N}"
            read sesi
            if [ -d "auth_info_$sesi" ]; then
                echo -ne " ${W}Profil sudah ada. Reset? (y/n): ${N}"
                read hapus
                [ "$hapus" == "y" ] && rm -rf "auth_info_$sesi" || continue
            fi
            node wa_enc.js "$sesi"
            read -p "Tekan Enter..."
            ;;
        3)
            fake_hack
            echo -ne "\n ${W}Nama profil: ${N}"
            read sesi
            pm2 start wa_enc.js --name "$sesi" -- "$sesi"
            pm2 save
            echo -e " ${G}✔${N} ${W}Auto-Pilot aktif!${N}"
            read -p "..."
            ;;
        4)
            echo -e "\n ${G}●${N} ${W}Status sistem:${N}"
            pm2 list
            read -p "Tekan Enter..."
            ;;
        5)
            echo -ne "\n ${W}Nama profil: ${N}"
            read sesi
            pm2 delete "$sesi"
            rm -rf "auth_info_$sesi"
            echo -e " ${G}✔${N} ${W}Profil dihapus${N}"
            read
            ;;
        6)
            echo -ne "\n ${W}Reset semua data? (y/n): ${N}"
            read confirm
            if [ "$confirm" == "y" ]; then
                pm2 delete all
                rm -rf auth_info_*
                echo -e " ${G}✔${N} ${W}Reset selesai${N}"
            fi
            read
            ;;
        0)
            echo -e "\n ${G}✔${N} ${W}Bye bro 😎${N}\n"
            exit 0
            ;;
        *)
            echo -e "\n ${R}!${N} ${W}Menu tidak valid${N}"
            sleep 1
            ;;
    esac
done
