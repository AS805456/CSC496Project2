set -x
sudo git clone -b docker --single-branch https://github.com/AS805456/cluster-template/
cd cluster-template/Stream
make
sudo docker build -t stream .
