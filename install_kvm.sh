set -x

sudo apt-get update
sudo apt-get install -y numactl
sudo apt-get install -y qemu-kvm libvirt-bin ubuntu-vm-builder
bridge-utils virt-manager libosinfo-bin libguestfs-tools virt-top
sudo adduser `id -un` libvirtd
sudo cd /srv/vm
sudo .net/sh
# wget http://releases.ubuntu.com/16.04/ubuntu-16.04.6-desktop-amd64.iso
# qemu-img create -f qcow2 ubuntu.qcow2 20G
# sudo virt-install --name test --connect qemu:///system --ram 1024 --disk path=ubuntu.qcow2,format=qcow2,bus=virtio,size=8 --vcpus 8 --os-type linux --network network=default --graphics none --console pty,target_type=serial --location=ubuntu-14.04.6-server-amd64.iso --extra-args 'console=ttyS0,115200n8 serial'
