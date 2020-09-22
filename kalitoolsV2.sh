#!/bin/bash

export OPTHOME=/opt
export LOG=/var/log/whitesuit_installation.log

clone() {
	local category="$(echo "$1" | awk '{print $1}')"
	local repository="$(echo "$1" | awk '{print $2}')"
	if [ $(curl -LI "$repository" -o /dev/null -w '%{http_code}\n' -s) == "404" ]; then 
		echo "ERROR: $repository no encontrado" >> "$LOG"
	elif ! [ -d "$OPTHOME/$category/$(basename "$repository" | sed 's/.git//')" ] ; then
		git -C "$OPTHOME/$category" clone "$repository" &>> "$LOG"
	fi
}	
export -f clone

if [ "$USER" != root ] ; then
	echo "Favor de volver a correr el programa como 'sudo $0'" >&2
	exit 1
fi

# Instalar GNU parallel para descargar dependencias en paralelo
if ! which parallel &>/dev/null ; then
	echo "Preparando dependencias" >&2
	apt update -y -qq && apt install -y -qq parallel
fi


for dir in Reconocimiento VulnAnalisis Explotacion; do
	mkdir -p "$OPTHOME/$dir"
done

# Limpiar logs
echo -n "" > "$LOG"

declare -a pairs
pairs=(
	"Reconocimiento https://github.com/BloodHoundAD/BloodHound.git"
	"Reconocimiento https://github.com/FortyNorthSecurity/EyeWitness.git"
	"Reconocimiento https://github.com/Mosuan/FileScan.git"
	"Reconocimiento https://github.com/chrismaddalena/ODIN.git"
	"Reconocimiento https://github.com/SecHackLabs/webhackshl.git"
	"Reconocimiento https://github.com/elceef/dnstwist.git"
	"Reconocimiento https://github.com/ElevenPaths/FOCA.git"
	"Reconocimiento https://github.com/wKovacs64/hibp.git"
	"Reconocimiento https://github.com/m4ll0k/Infoga.git"
	"Reconocimiento https://github.com/nettitude/Prowl.git"
	"Reconocimiento https://github.com/vaguileradiaz/tinfoleak.git"
	"Reconocimiento https://github.com/jopcode/whour"
	"Reconocimiento https://github.com/leebaird/discover"

	"VulnAnalisis https://github.com/inurlx/CLOUDKiLL3R.git"
	"VulnAnalisis https://www.github.com/MetaChar/Mercury"
	"VulnAnalisis https://github.com/urbanadventurer/WhatWeb"
	"VulnAnalisis https://github.com/smicallef/spiderfoot.git"
	"VulnAnalisis https://github.com/peterpt/eternal_scanner.git"

	"Explotacion https://github.com/byt3bl33d3r/CrackMapExec.git"
	"Explotacion https://github.com/EmpireProject/Empire.git"
	"Explotacion https://github.com/xsan-lahci/NWHT-V1.git"
	"Explotacion https://github.com/ZettaHack/PasteZort.git"
	"Explotacion https://github.com/Screetsec/TheFatRat.git"
	"Explotacion https://github.com/Souhardya/UBoat.git"
	"Explotacion https://github.com/Veil-Framework/Veil.git"
	"Explotacion https://github.com/HackingEnVivo/WaterDoS.git"
	"Explotacion https://github.com/MooseDojo/apt2.git"
	"Explotacion https://github.com/k4mpr3t/b4tm4n.git"
	"Explotacion https://github.com/vanhoefm/krackattacks-poc-zerokey.git"
	"Explotacion https://github.com/AlessandroZ/LaZagne.git"
	"Explotacion https://github.com/cldrn/macphish.git"
	"Explotacion https://github.com/wifiphisher/wifiphisher.git"
	"Explotacion https://github.com/pasahitz/zirikatu.git"
	"Explotacion https://github.com/trustedsec/unicorn.git"
	"Explotacion https://github.com/M4sc3r4n0/Evil-Droid.git"
)

parallel -j4 --bar clone ::: "${pairs[@]}"

if [ -s "$LOG" ] ; then
	echo "Los siguientes repositorios no fueron encontrados:" >&2
	cat "$LOG"
	exit 1
else
	echo "Todas las herramientas fueron descargadas exitosamente" >&2
	exit 0
fi
