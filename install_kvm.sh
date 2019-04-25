set -x

sudo su
apt-get update
apt-get install -y numactl
apt install virtinst
apt-get install -y qemu-kvm libvirt-bin ubuntu-vm-builder
#This line does not work: bridge-utils virt-manager libosinfo-bin libguestfs-tools virt-top
#Replace 'id -un' with your id
sudo adduser 'id -un' libvirtd
wget http://releases.ubuntu.com/16.04/ubuntu-16.04.6-server-amd64.iso
qemu-img create -f qcow2 ubuntu.qcow2 20G
virt-install --name test --connect qemu:///system --ram 1024 --disk path=ubuntu.qcow2 --vcpus 8 --os-type linux --network network=default --graphics none --console pty --location=ubuntu-16.04.6-server-amd64.iso --extra-args 'console=ttyS0,115200n8 serial'
#This version of the last line not working: sudo virt-install --name test --connect qemu:///system --ram 1024 --disk path=ubuntu.qcow2,format=qcow2,bus=virtio,size=8 --vcpus 8 --os-type linux --network network=default --graphics none --console pty,target_type=serial --location=ubuntu-16.04.6-server-amd64.iso --extra-args 'console=ttyS0,115200n8 serial'
