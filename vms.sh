vm_name='Win7'
os_type='Windows7_64'
memory='4096'
video_memory='256'
cpus='2'
disk_file='/home/wls/VirtualBox\ VMs/Win7/Win7.vdi'
disk_size='32000'
disk_controller='SATA Controller'
dvd_controller='IDE Controller'
os_iso='/home/wls/Downloads/ru_windows7_64bit_Ultimate_msdn_2020.iso'

VBoxManage createvm --name $vm_name --ostype $os_type --register
VBoxManage modifyvm $vm_name --memory $memory
VBoxManage modifyvm $vm_name --vram $video_memory
VBoxManage modifyvm $vm_name --cpus $cpus
VBoxManage createhd --filename "$disk_file" --size $disk_size --format VDI
VBoxManage storagectl $vm_name --name "$disk_controller" --add sata --controller IntelAhci
VBoxManage storagectl $vm_name --name "$dvd_controller" --add ide --controller PIIX4
VBoxManage storageattach $vm_name --storagectl "$disk_controller" --port 0 --device 0 --type hdd --medium "$disk_file"
VBoxManage storageattach $vm_name --storagectl "$dvd_controller" --port 1 --device 0 --type dvddrive --medium $os_iso
VBoxManage modifyvm $vm_name --vrde on
VBoxManage modifyvm $vm_name --vrdemulticon on --vrdeport 3390
VBoxManage showvminfo $vm_name

#VBoxManage unregistervm $vm_name --delete
