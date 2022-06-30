# Working for ubuntu 20.04
# sudo apt update && sudo apt upgrade
# sleep 1
# sudo apt install wget apt-transport-https gnupg nano screen
# sudo ufw allow OpenSSH
# sudo ufw allow 25565
# sudo ufw enable
# sudo apt install openjdk-17-jre-headless
# sleep 1
# sudo apt install git
# sleep 1


echo "Enter the folder name that the minecraft server will be placed, THIS CAN NOT BE ANY SPECIAL CHARS OR A BLANK SPACE:"
read folder
mdir="./minecraftServers/"
dir="./minecraftServers/$folder"
mkdir $mdir 
mkdir $dir

mkdir $dir/buildtools
wget -O $dir/buildtools/BuildTools.jar  https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
echo "Please select a minecraft verison (1.19 to 1.18), PLEASE DO NOT ENTER ANY OTHER TEXT BUT THE VERISON (E.x : 1.19):"
read mcverison
cd $dir/buildtools
java -jar $dir/buildtools/BuildTools.jar --rev $mcverison

cd ..
cd ..
cd ..

mkdir $dir/server
mv $dir/buildtools/spigot-$mcverison.jar $dir/server/spigot.jar

wget https://raw.githubusercontent.com/GatewayDuck/AutoSpigot/main/control.sh -O $dir/control

echo "By using this program, you agree you minecraft's elua.\nTo continue press enter:"
read yea

wget https://raw.githubusercontent.com/GatewayDuck/AutoSpigot/main/eula.txt -O $dir/server/eula.txt
