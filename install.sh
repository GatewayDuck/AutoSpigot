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
mdir="./minecraftServers/"
dir="./minecraftServers/$folder"
mkdir $mdir 
mkdir $dir

mkdir $dir/buildtools
wget -O $dir/buildtools/BuildTools.jar  https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
echo "Please select a minecraft verison (1.19 to 1.18), PLEASE DO NOT ENTER ANY OTHER TEXT BUT THE VERISON (E.x : 1.19):"
read mcverison
java -jar $dir/buildtools/BuildTools.jar --rev $mcverison

mkdir $dir/server
mv $dir/buildtools/spigot-$mcverison.jar $dir/server/spigot.jar

# echo -e "start: java -Xms3G -Xmx3G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar ./server/spigot.jar nogui"

