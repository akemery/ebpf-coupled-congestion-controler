CC=$1
sudo sysctl net.ipv4.tcp_available_congestion_control
sudo modprobe tcp_vegas
sudo sysctl net.ipv4.tcp_congestion_control
sudo sysctl -w net.ipv4.tcp_congestion_control=$CC
sudo sysctl net.ipv4.tcp_congestion_control
sudo sysctl net.ipv4.tcp_available_congestion_control
#sudo sysctl -p
