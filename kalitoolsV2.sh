#!/bin/bash

export OPTHOME=/opt

cd $OPTHOME

if [ ! -d $OPTHOME/Reconocimiento ]; then
	mkdir Reconocimiento
fi

if [ ! -d $OPTHOME/VulnAnalisis ]; then
	mkdir VulnAnalisis
fi

if [ ! -d $OPTHOME/Explotacion ]; then
	mkdir Explotacion
fi

git -C $OPTHOME/Reconocimiento clone https://github.com/BloodHoundAD/BloodHound.git
git -C $OPTHOME/Reconocimiento clone https://github.com/FortyNorthSecurity/EyeWitness.git
git -C $OPTHOME/Reconocimiento clone https://github.com/Mosuan/FileScan.git
git -C $OPTHOME/Reconocimiento clone https://github.com/chrismaddalena/ODIN.git
git -C $OPTHOME/Reconocimiento clone https://github.com/SecHackLabs/webhackshl.git
git -C $OPTHOME/Reconocimiento clone https://github.com/elceef/dnstwist.git
git -C $OPTHOME/Reconocimiento clone https://github.com/ElevenPaths/FOCA.git
git -C $OPTHOME/Reconocimiento clone https://github.com/wKovacs64/hibp.git
git -C $OPTHOME/Reconocimiento clone https://github.com/m4ll0k/Infoga.git
git -C $OPTHOME/Reconocimiento clone https://github.com/nettitude/Prowl.git
git -C $OPTHOME/Reconocimiento clone https://github.com/vaguileradiaz/tinfoleak.git
git -C $OPTHOME/Reconocimiento clone https://github.com/jopcode/whour
git -C $OPTHOME/Reconocimiento clone https://github.com/leebaird/discover

git -C $OPTHOME/VulnAnalisis clone https://github.com/inurlx/CLOUDKiLL3R.git
git -C $OPTHOME/VulnAnalisis clone https://www.github.com/MetaChar/Mercury
git -C $OPTHOME/VulnAnalisis clone https://github.com/urbanadventurer/WhatWeb/
git -C $OPTHOME/VulnAnalisis clone https://github.com/smicallef/spiderfoot.git
git -C $OPTHOME/VulnAnalisis clone https://github.com/peterpt/eternal_scanner.git

git -C $OPTHOME/Explotacion clone https://github.com/byt3bl33d3r/CrackMapExec.git
git -C $OPTHOME/Explotacion clone https://github.com/EmpireProject/Empire.git
git -C $OPTHOME/Explotacion clone https://github.com/xsan-lahci/NWHT-V1.git
git -C $OPTHOME/Explotacion clone https://github.com/ZettaHack/PasteZort.git
git -C $OPTHOME/Explotacion clone https://github.com/Screetsec/TheFatRat.git
git -C $OPTHOME/Explotacion clone https://github.com/Souhardya/UBoat.git
git -C $OPTHOME/Explotacion clone https://github.com/Veil-Framework/Veil.git
git -C $OPTHOME/Explotacion clone https://github.com/HackingEnVivo/WaterDoS.git
git -C $OPTHOME/Explotacion clone https://github.com/MooseDojo/apt2.git
git -C $OPTHOME/Explotacion clone https://github.com/k4mpr3t/b4tm4n.git
git -C $OPTHOME/Explotacion clone https://github.com/vanhoefm/krackattacks-poc-zerokey.git
git -C $OPTHOME/Explotacion clone https://github.com/AlessandroZ/LaZagne.git
git -C $OPTHOME/Explotacion clone https://github.com/cldrn/macphish.git
git -C $OPTHOME/Explotacion clone https://github.com/wifiphisher/wifiphisher.git
git -C $OPTHOME/Explotacion clone https://github.com/pasahitz/zirikatu.git
git -C $OPTHOME/Explotacion clone https://github.com/trustedsec/unicorn.git
git -C $OPTHOME/Explotacion clone https://github.com/M4sc3r4n0/Evil-Droid.git
