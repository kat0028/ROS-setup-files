#!/bin/bash
bash <(wget -q -O - https://bitbucket.org/DataspeedInc/ros_binaries/raw/master/scripts/setup.bash) 
sudo apt-get install ros-$ROS_DISTRO-dataspeed-dbw-simulator -y
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
sudo apt update
sudo apt upgrade -y
