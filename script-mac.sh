# disable spotlight indexing
sudo mdutil -i off -a

sudo VBoxManage createvm --name testArch --ostype ArchLinux_64 --register
sudo VBoxManage modifyvm testArch --cpus 1 --memory 1024 --vram 12
sudo VBoxManage createhd --filename ./testArch.vdi --size 5120 --variant Standard
sudo VBoxManage storagectl testArch --name "SATA Controller" --add sata --bootable on
sudo VBoxManage storageattach testArch --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium ./testArch.vdi
sudo VBoxManage storagectl testArch --name "IDE Controller" --add ide
wget http://mirror.rackspace.com/archlinux/iso/2022.02.01/archlinux-2022.02.01-x86_64.iso
sudo VBoxManage storageattach testArch --storagectl "IDE Controller" --port 0  --device 0 --type dvddrive --medium ./archlinux-2022.02.01-x86_64.iso
sudo VBoxManage modifyvm testArch --vrde on
# VBoxHeadless --startvm testArch
