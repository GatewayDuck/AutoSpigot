echo "Do you want to run the first time configs [Y/n]:"
read runConfig
if [ $runConfig = "Y" ] then 
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
fi

echo "Enter the folder name that the minecraft server will be placed:"
read folder
mdir="./minecraftServers/"
dir="./minecraftServers/$folder"
mkdir $mdir 
mkdir $dir

mkdir $dir/buildtools
wget -O $dir/buildtools/BuildTools.jar  https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
echo "Please select a minecraft verison:"
read mcverison
cd $dir/buildtools
java -jar BuildTools.jar --rev $mcverison
sleep 10
cd ..
cd ..
cd ..

mkdir $dir/server
mv $dir/buildtools/spigot-$mcverison.jar $dir/server/spigot.jar

wget https://raw.githubusercontent.com/GatewayDuck/AutoSpigot/main/control.sh -O $dir/control
chmod u+x $dir/control

echo "By using this program, you agree you minecraft's elua.\nTo continue press enter:"
read yea

wget https://raw.githubusercontent.com/GatewayDuck/AutoSpigot/main/eula.txt -O $dir/server/eula.txt




# Working for ubuntu 20.04

# sudo update-alternatives --config java
# configs the java verison, use java 8 for veriosns below 1.17 use java 16 for 1.17 use java 17 for 1.18 and java 18 for 1.19
