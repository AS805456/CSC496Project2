set -x

#Install singularity
wget https://github.com/sylabs/singularity/releases/download/2.4/singularity-2.4.tar.gz                        
tar zxvf singularity-2.4.tar.gz                                   
cd singularity-2.4                                               
./autogen.sh
./configure --prefix=/usr/local
make
sudo make install

#Attempting to build a container
singularity create test.img
sudo singularity build test.img
singularity shell test.img
