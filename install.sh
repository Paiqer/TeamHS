#!/usr/bin/env bash
cd $(cd $(dirname $0); pwd)
install() {
rm -rf $HOME/.telegram-cli
sudo chmod +x tg
chmod +x TeamHS
chmod +x ts
./ts
}
get() {
rm -fr TeamHS.lua
rm -fr sudo.lua
wget "https://raw.githubusercontent.com/Paiqer/TeamHS/master/TeamHS.lua"
lua start.lua
}
installall(){
Version=`lsb_release -rs | cut -f1 -d"."`
sudo apt-get update
sudo apt-get upgrade
sudo timedatectl set-timezone Asia/Baghdad
sudo apt-get install screen
sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev lua-socket lua-sec lua-expat libevent-dev make unzip redis-server autoconf g++ libjansson-dev libpython-dev expat libexpat1-dev
sudo apt-get update
sudo apt-get install upstart-sysv
wget http://luarocks.org/releases/luarocks-2.2.2.tar.gz;tar zxpf luarocks-2.2.2.tar.gz;cd luarocks-2.2.2 && ./configure
sudo make bootstrap
sudo luarocks install luasocket
sudo luarocks install luasec
sudo apt-get install libconfig++9v5 -y 
sudo apt-get install libstdc++6 -y
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y 
sudo apt-get install lua-lgi -y  
sudo apt-get install libnotify-dev -y 
if [ "$Version" == "18" ];then
echo -e "${WHITB}\n¦ Installing depedencies for ubuntu 18  ... \n${CNIL}"
cd /lib/x86_64-linux-gnu/ && sudo ln -s libreadline.so.7.0 libreadline.so.6
wget "th3boss.com/installubuntu18/compat-libevent2-5_2.0.21-1ubuntu18_amd64.deb" && sudo dpkg -i compat-libevent2-5_2.0.21-1ubuntu18_amd64.deb
rm compat-libevent2-5_2.0.21-1ubuntu18_amd64.deb
fi
}
if [ "$1" = "ins" ]; then
install
fi
if [ "$1" = "get" ]; then
get
fi
installall
cd ..
rm -rf luarocks*
cd TeamHS
rm -rf luarocks*
lua start.lua


