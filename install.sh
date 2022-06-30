# Working for ubuntu 20.04
sudo apt update && sudo apt upgrade
sleep 1
sudo apt install wget apt-transport-https gnupg nano screen
sudo ufw allow OpenSSH
sudo ufw allow 25565
sudo ufw enable
sudo apt install openjdk-17-jre-headless
sleep 1
sudo apt install git
sleep 1
echo "Enter the folder name that the minecraft server will be placed, THIS CAN NOT BE ANY SPECIAL CHARS OR A BLANK SPACE:"
read folder
mkdir minecraftServers/$folder
cd minecraftServers/$folder
mkdir buildtools && cd buildtools
wget -O BuildTools.jar  https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
echo "Please select a minecraft verison (1.19 to 1.8), PLEASE DO NOT ENTER ANY OTHER TEXT BUT THE VERISON (E.x : 1.19):"
read mcverison
java -jar BuildTools.jar --rev $mcverison
mkdir server && cd server
mv ~/buildtools/spigot-$mcverison.jar ~/server/spigot.jar
