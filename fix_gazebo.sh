#!/bin/bash
gazebo
mv ~/.ignition/fuel/config.yaml ~/.ignition/fuel/config.yaml.bak
sed 's/ignitionfuel/ignitionrobotics/' ~/.ignition/fuel/config.yaml.bak > ~/.ignition/fuel/config.yaml
echo "export SVGA_VGPU10=0" >> ~/.profile
source ~/.profile