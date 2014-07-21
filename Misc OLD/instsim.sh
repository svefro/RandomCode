#############################################################
## Ardupilot SITL Package install Script
## To be able to run this script type: chmod +x instsim.sh
## then launch the script with: ./instsim.sh
##
## If something fails you can uncomment the lines that was successfully
## by placing a '#' at the beginning of the line
##
## To be able to run this script in the terminal run:
## chmod +x instsim.sh
## first to mark the script as executable
##
##
## Svein A. Frotjold
## svefro@gmail.com
## this may work. i guarantee nothing.
#############################################################


#######################
## Update Package List
#######################
read -p "Do you want to run ''sudo apt-get update''? Do this if it's the first time you run this script (y/n) " RESP1
if [ "$RESP1" = "y" ]; then
    sudo apt-get update
fi

#######################
## Install Packages
#######################
read -p "Do you want to install common required software? (y/n) " RESP
if [ "$RESP" = "y" ]; then
    sudo apt-get -y install dos2unix
    sudo apt-get -y install python-pip
    sudo apt-get -y install python-wxgtk2.8
    sudo apt-get -y install python-matplotlib
    sudo apt-get -y install python-opencv
    sudo apt-get -y install g++
    sudo apt-get -y install g++-4.7
    sudo apt-get -y install gawk
    sudo apt-get -y install git
    sudo apt-get -y install ccache	
fi

read -p "Do you want to run install required packages for ArduPlane (y/n) " RESP
if [ "$RESP" = "y" ]; then
    sudo apt-get -y install libexpat1-dev
    sudo apt-get -y install autoconf
    sudo apt-get -y install libtool
    sudo apt-get -y install automake
fi



#######################
## put directories in .bashrc only run this once!!!
## sample: echo 'PATH HERE' >> ~/.bashrc
## open .bashrc in your user folder to check that the lines is only added once
## the lines have been disabled with '#' by default. copy the lines below to the bottom of .bashrc and remove the '#' from all the lines
#######################

read -p "Do you want to insert required lines in .rcbash? (only do this once) (y/n) " RESP
if [ "$RESP" = "y" ]; then
    echo 'export PATH=$PATH:$HOME/ardupilot/Tools/autotest'  >> ~/.bashrc 
    echo 'export PATH=/usr/lib/ccache:$PATH' >> ~/.bashrc 
fi


#######################
#Reload .bashrc
#######################
echo "Reloading .bashrc"
. ~/.bashrc


#######################
## Install Python Packages with pip
#######################

sudo pip install pymavlink
sudo pip install mavproxy


#######################

