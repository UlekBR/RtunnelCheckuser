#!/bin/bash


mkdir /opt
mkdir /opt/rt

apt update -y && apt upgrade -y
apt install curl -y

arch=$(uname -m)

if [[ $arch == "x86_64" || $arch == "amd64" || $arch == "x86_64h" ]]; then
    echo "Sistema baseado em x86_64 (64-bit Intel/AMD)"
    curl -o "/opt/rt/rtcheck" -f "https://raw.githubusercontent.com/UlekBR/RtunnelCheckuser/main/x86"
elif [[ $arch == "aarch64" || $arch == "arm64" || $arch == "armv8-a" ]]; then
    echo "Sistema baseado em arm64 (64-bit ARM)"
    curl -o "/opt/rt/rtcheck" -f "https://raw.githubusercontent.com/UlekBR/RtunnelCheckuser/main/arm"
else
    echo "Arquitetura não reconhecida: $arch"
    return
fi

curl -o "/opt/rt/menu.sh" -f "https://raw.githubusercontent.com/UlekBR/RtunnelCheckuser/main/menu.sh"

chmod +x /opt/rt/rtcheck
chmod +x /opt/rt/menu.sh

ln -s /opt/rt/menu.sh /usr/local/bin/rtcheck
echo -e "Para iniciar o menu digite: rtcheck"

