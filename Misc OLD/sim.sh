#!/bin/bash
##############################
# Navigate to ArduCopter Folder
##############################


##############################
#Launch sim_vehicle.sh
#
#Mission planner port: 14550
#MavProxy Windows port: 14551
#
##############################

read -p "Witch software do you want to simulate? Copter=c, Plane=p, Rover=r (c/p/r) " RESPM
if [ "$RESPM" = "c" ]; then
    cd ~/ardupilot/ArduCopter
    read -p "Do you want to reset parameters to default? (y/n) " RESP
    if [ "$RESP" = "y" ]; then
        sim_vehicle.sh -v ArduCopter -f X -j 2 -w --console --out=192.168.1.13:14550 --out=192.168.1.13:14551
    else
        sim_vehicle.sh -v ArduCopter -f X -j 2 --console --out=192.168.1.13:14550 --out=192.168.1.13:14551
    fi
fi

if [ "$RESPM" = "p" ]; then
    echo "Plane is not tested"
    echo "Note: JSBSim needs to be installed and path added to .bashrc"
    cd ~/ardupilot/ArduPlane
    read -p "Do you want to reset parameters to default? (y/n) " RESP
    if [ "$RESP" = "y" ]; then
        sim_vehicle.sh -v ArduPlane -j 2 -w --console --out=192.168.1.13:14550 --out=192.168.1.13:14551
    else
        sim_vehicle.sh -v ArduPlane -j 2 --console --out=192.168.1.13:14550 --out=192.168.1.13:14551
    fi
fi

if [ "$RESPM" = "r" ]; then
    cd ~/ardupilot/APMrover2
    read -p "Do you want to reset parameters to default? (y/n) " RESP
    if [ "$RESP" = "y" ]; then
        sim_vehicle.sh -v APMrover2 -j 2 -w --console --out=192.168.1.13:14550 --out=192.168.1.13:14551
    else
        sim_vehicle.sh -v APMrover2 -j 2 --console --out=192.168.1.13:14550 --out=192.168.1.13:14551
    fi
fi




