set -x

sudo apt-get update
sudo apt-get install -y qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils virt-manager libosinfo-bin libguestfs-tools virt-top
sudo adduser `id -un` libvirtd
sudo wget http://releases.ubuntu.com/16.04/ubuntu-16.04.6-server-amd64.iso
sudo qemu-img create -f qcow2 ubuntu.qcow2 20G
sudo virt-install --name test \
--connect qemu:///system \
--ram 16384 \
--disk path=ubuntu.qcow2 \
--vcpus 16 \
--os-type linux \
--network network=default \
--graphics none \
--location=ubuntu-16.04.6-server-amd64.iso \
--initrd-inject Kickstarter.cfg \
--extra_args="ks=https://github.com/AS805456/cluster-template/blob/kvm/Kickstarter.cfg console=ttyS0,115200n8 serial"
#This version of the last line not working: sudo virt-install --name test --connect qemu:///system --ram 1024 --disk path=ubuntu.qcow2,format=qcow2,bus=virtio,size=8 --vcpus 8 --os-type linux --network network=default --graphics none --console pty,target_type=serial --location=ubuntu-16.04.6-server-amd64.iso --extra-args 'console=ttyS0,115200n8 serial'
#For single line copy paste:
# sudo virt-install --name test --connect qemu:///system --ram 16384 --disk path=ubuntu.qcow2 --vcpus 16 --os-type linux --network network=default --graphics none --location=ubuntu-16.04.6-server-amd64.iso --initrd-inject cluster-template/Kickstarter.cfg --extra-args="ks=file:/Kickstarter.cfg console=ttyS0,115200n8 serial"
