#!/bin/bash
#installs
sudo apt-get install gstreamer1.0-tools libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev
sudo apt-get install libspnav-dev
sudo apt-get install libi2c-dev 

#setup workspace
mkdir -p racer_ws/src
cd racer_ws/src

#servos
git clone https://github.com/kat0028/servo_array_driver.git
git clone https://github.com/kat0028/ros-i2cpwmboard.git
git clone https://github.com/kat0028/servo_reconfig.git

# joystick
git clone https://github.com/kat0028/joytransfer.git
git clone https://github.com/ros-drivers/joystick_drivers.git

#cameras
git clone https://github.com/rt-net/jetson_nano_csi_cam_ros.git
git clone https://github.com/ros-drivers/gscam.git 

#launch files
git clone https://github.com/kat0028/racer_launch.git

#make workspace
cd ../
catkin_make
source devel/setup.bash

#Red Ring
wget https://www.waveshare.com/w/upload/e/eb/Camera_overrides.tar.gz
tar zxvf Camera_overrides.tar.gz 
sudo cp camera_overrides.isp /var/nvidia/nvcam/settings/
sudo chmod 664 /var/nvidia/nvcam/settings/camera_overrides.isp
sudo chown root:root /var/nvidia/nvcam/settings/camera_overrides.isp

#OpenCV Rollback
sudo apt -y --allow-downgrades install libopencv-dev=3.2.0+dfsg-4ubuntu0.1
sudo apt-mark hold libopencv-dev
