echo "Do you want to run the first time configs [Y/n]:"
read runConfig
if [ $runConfig = "Y" ] ; then 
    sudo apt update && sudo apt upgrade
    sleep 1
    sudo apt install wget apt-transport-https gnupg nano screen
    sudo ufw allow OpenSSH
    sudo ufw allow 25565
    echo "Installing java verisons"
    sleep 1
    sudo apt install openjdk-17-jre-headless
    sudo apt install openjdk-16-jre-headless
    sudo apt install openjdk-18-jre-headless
    sleep 1
    sudo apt install git
    sleep 1
fi

echo "Are you editing a preexisting installion?" 
read installed
if [ $installed = "Y"] ; then 
    echo "What is the folder name?"
    read folder
    mdir="./minecraftServers/"
    dir="./minecraftServers/$folder"
    echo "Are you changing the verison? [Y/n]: "
    read chver
    if [ $chver = "Y"] ; then
        rm $dir/spigot.jar $dir/eula.txt
        echo "The files are now configed right, please rerun the script and choose install new instead of preinstall"
        exit 1
    fi
    echo "Do you want to reset the world? [Y/n]: "
    read reset
    if [ $reset = "Y" ] ; then
        echo "Are you sure, this can not be undone. [Y/n]: "
        read $resetsu
        if [ $resetsu = "Y" ] ; then
           echo "Deleting files."
           rm $dir/world -rf
           sleep 3
           echo "Done. Restart the server to see your changes."
        fi
    fi
else 
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

    echo "Please write a motd for your minecraft server: "
    read motd
    wget https://raw.githubusercontent.com/GatewayDuck/AutoSpigot/main/server.properties -O $dir/server/server.properties
    echo $motd > $dir/server/server.properties
fi




# Working for ubuntu 20.04

# sudo update-alternatives --config java
# configs the java verison, use java 8 for veriosns below 1.17 use java 16 for 1.17 use java 17 for 1.18 and java 18 for 1.19
