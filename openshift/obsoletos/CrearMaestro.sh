#! /bin/bash -x



su bitnami <<EOF
ssh-keygen -f /bitnami/wordpress/.ssh/devnely.org -t rsa -b 4096 -N '' -m PEM  -C "devnely.org"
eval "\$(ssh-agent -s)"
ssh-add /bitnami/wordpress/.ssh/devnely.org
EOF


su bitnami <<EOF
ssh-keygen -p '-f /bitnami/wordpress/.ssh/devnelyorg' '-t rsa' '-b 4096' '-N ""' '-m PEM'  '-C "devnely.org"'
eval -p '"$(ssh-agent -s)"'
ssh-add -p '/bitnami/wordpress/.ssh/devnelyorg'
EOF



 virt-install --name pruebaami \
                 --description 'AMI aws' \
                 --check path_in_use=off \
                 --ram 16204 --vcpus 4 \
                 --disk path="amzn2-kvm-2.0.20200722.0-x86_64.xfs.gpt.qcow2",size=40 \
                 --os-type linux \
                 --graphics spice \
                 --network bridge=virbr0 \
                 --noreboot \
                 --boot hd




# # rm *.iso
# # rm meta-data
# # rm user-data
# # rm vdb.qcow2

# cat > user-data <<EOF
# #cloud-config
# user: origin
# password: origin
# ssh_pwauth: True
# chpasswd: { expire: False }
# ssh_authorized_keys:
# - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDm4NBnH0u+tjuWiTbiKC6lYV+HWr7OW1/pR6b/F3xQNLwHo1992EV21fhf2Ih2gHh1/8wcwg1Z/0edZn1LTahgIvzFONYaQNo9f+hTJ05AVlB8h0OJtL3kta/6mBq0h5whhCQ5so72aD8hHb/erxsXWFLIpyIP1uBOTTOsgoLGhuKdZNF/8WrewIQtMvN+f98r8fspfL+oDyQKgq1+L/nOq5/GK5F6QCHyi4AJSJxYZNP3N8drtvE0ZForJ/CH1tJuNZdxNgemnBoaORpWbjg3NdgxDoJG97/DN+jK6bt41+CrnKfgPbj7BLP54ijtrZ0Z/mUF5IQz+6+2+apfCyOrW9 emilio@fed-emilio-pc.home
# - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3SsWP5xvacL+GwsuTf1HZGotDuw4+lz4W365RyFZspQo7dYZRJePJNmW4hTS5+xPPN7mjBUUyS3/95t/L5CIRxFTng3Xn4yEVm0LY3l8pUoG11MfmxRSsmooWwXTmf9o0IfdCN+YcAYhzCLrNarM2MjWfliVBxBJ0gaHzLC1QsOYQcCuHHjITqnxTEzkvzKd+R2jLJxySrTPOmfGOHvOnkJCeJCGKUWZ6Nzg64lfpwUgUevfLyZtD5jGtm9RSw/P8PBmOJMSVQwR3gK9bW5oBB/evue2zpeBsNHbZaGFw7B1yfCfM22K8x9NLVYHI7ZrNjt/GnXljnzuAukMnGG5j emilio@localhost.localdomain

# runcmd:
#   - sudo sh -c 'nmcli con add type ethernet con-name "master eth0" ifname eth0 ip4 192.168.122.25/24 ipv4.method manual gw4 192.168.122.1'
#   - sudo sh -c 'nmcli con up "master eth0" iface eth0'
#   - sudo bash -c 'nmcli con delete "System eth0"'
#   - sudo sh -c 'sed -i '"'"'/^.*search.*/a nameserver 192.168.1.1'"'"' /etc/resolv.conf'
#   - sudo bash -c 'sed -i '"'"'/\[main\]/a dns=none'"'"' /etc/NetworkManager/NetworkManager.conf'
#   - sudo sh -c 'echo -e "amigo\namigo" | passwd root --stdin'
#   - sudo sh -c 'rpm-ostree upgrade'
#   - sudo sh -c 'systemctl poweroff'
# EOF


# echo "Creado archivo user-data0"



# cat > meta-data <<EOF
# instance-id: master-00
# local-hostname: ctrl.srv.world
# EOF

# echo "Creado archivo user-metadata0"



# genisoimage  -output 0.iso -volid cidata -joliet -rock user-data meta-data 


# echo "Creada imagen 0.iso"

# # ===========================================================================================





# cat > user-data <<EOF
# #cloud-config
# runcmd:
#   - sudo sh -c 'rpm-ostree install kbd emacs git centos-release-openshift-origin311 epel-release pyOpenSSL ntp'
#   - sudo sh -c 'systemctl poweroff'
# EOF

# echo "Creado archivo user-metadata1"

  
# cat > meta-data <<EOF
# instance-id: master-01
# EOF



# echo "Creado archivo user-metadata1"

# genisoimage  -output 1.iso -volid cidata -joliet -rock user-data meta-data

# echo "Creada imagen 1.iso"

# # ========================================================================================



# cat > user-data <<EOF
# #cloud-config
# runcmd:
#   - sudo sh -c 'localectl set-keymap "es"'
#   - sudo sh -c 'dd if=/dev/zero of=/var/swapfile bs=1024 count=8388608' #8x1024x1024=8388608
#   - sudo sh -c 'mkswap /var/swapfile'
#   - sudo sh -c 'chmod 0600 /var/swapfile'
#   - sudo sh -c 'echo -e "/var/swapfile\tswap\tswap\tdefaults\t0\t0" >> /etc/fstab'
#   - sudo sh -c 'systemctl daemon-reload'
#   - sudo sh -c 'swapon /var/swapfile'
#   - sudo sh -c 'systemctl enable iptables'
#   - sudo sh -c 'systemctl start iptables'
#   - for k in 80 22 1936 8053 53 443 8443 10250 10010 9200 9300 2049 2379 2380 9000 8444 1936 2379 2380;do  sudo iptables -I INPUT -p tcp --dport \$k -j ACCEPT;done
#   - for y in 8053 53 4789 2049;do sudo iptables -I INPUT -p udp --dport \$y -j ACCEPT;done
#   - sudo service iptables save
#   - sudo sh -c 'systemctl poweroff'
# EOF


# echo "Creado archivo user-data3"

# cat > meta-data <<EOF
# instance-id: master-02
# EOF

# echo "Creado archivo user-metadata2"

# genisoimage  -output 2.iso -volid cidata -joliet -rock user-data meta-data

# echo "Creada imagen 2.iso"


# # ===========================================================================================


# cat > user-data <<EOF
# #cloud-config
# runcmd:
#   - sudo bash -c 'mkdir -p /var/nfs-data'
#   - sudo bash -c 'mkfs.ext4 /dev/vdb'
#   - sudo bash -c 'systemctl daemon-reload'
#   - sudo bash -c 'mount -a'
#   - sudo bash -c 'echo "\$(blkid /dev/vdb | awk '"'"'{print\$2}'"'"')\$(echo -e "\t/var/nfs-data\text4\tdefaults\t0\t0")" >> /etc/fstab'
#   - sudo bash -c 'mount'
#   - sudo bash -c 'rpm-ostree install openshift-ansible'
#   - sudo bash -c 'systemctl poweroff'
# EOF

# echo "Creado archivo user-data3"

# cat > meta-data <<EOF
# instance-id: master-03
# EOF

# echo "Creado archivo user-metadata3"

# genisoimage  -output 3.iso -volid cidata -joliet -rock user-data meta-data

# echo "Creada imagen 3.iso"
 

# # ===========================================================================================



# cat > user-data <<EOF
# #cloud-config
# runcmd:
#   - sudo bash -c 'sed -i '"'"'s/^PasswordAuthentication.*$/PasswordAuthentication yes/'"'"' /etc/ssh/sshd_config'
#   - sudo bash -c 'systemctl restart sshd'
#   - sudo bash -c 'mkdir -p /var/nfs-data/{pv01,pv02,pv03,pv04,pv05}'
#   - sudo bash -c 'echo "/var/nfs-data/ *(ro,fsid=root,root_squash,no_subtree_check,_netdev)"  > /etc/exports.d/varnfsdata.exports'
#   - sudo bash -c 'echo "/var/nfs-data/pv01/ *(rw,sync)"  > /etc/exports.d/pv01.exports'
#   - sudo bash -c 'echo "/var/nfs-data/pv02/ *(rw,sync)"  > /etc/exports.d/pv02.exports'
#   - sudo bash -c 'echo "/var/nfs-data/pv03/ *(rw,sync)"  > /etc/exports.d/pv03.exports'
#   - sudo bash -c 'echo "/var/nfs-data/pv04/ *(rw,sync)"  > /etc/exports.d/pv04.exports'
#   - sudo bash -c 'echo "/var/nfs-data/pv05/ *(rw,sync)"  > /etc/exports.d/pv05.exports'
#   - sudo bash -c 'chmod -R 440 /etc/exports.d/'
#   - sudo bash -c 'chown -R nfsnobody.nfsnobody /var/nfs-data/'
#   - sudo bash -c 'chmod -R 0777 /var/nfs-data/'
#   - sudo bash -c 'exportfs -avr'
#   - sudo bash -c 'for i in nfs-server nfs-client.target;do systemctl enable \$i;done'
#   - sudo bash -c 'for i in nfs-server nfs-client.target;do systemctl start \$i;done'
#   - sudo bash -c 'for i in nfs-server nfs-client.target;do systemctl restart \$i;done'
#   - sudo bash -c 'setsebool -P nfs_export_all_rw 1'
#   - sudo bash -c 'setsebool -P virt_use_nfs 1'
#   - sudo bash -c 'setsebool -P virt_sandbox_use_nfs 1'
#   - export PORTMAPPER=\$(sudo rpcinfo -p | awk '{ if (\$3 ~ /tcp/ && \$5 ~ /portmapper/) {print\$4;exit}}')
#   - export STATUSTCP=\$(sudo rpcinfo -p | awk '{ if (\$3 ~ /tcp/ && \$5 ~ /status/) {print\$4;exit}}') && \
# export STATUSUDP=\$(sudo rpcinfo -p | awk '{ if (\$3 ~ /udp/ && \$5 ~ /status/) {print\$4;exit}}') && \
# export MOUNTTCP=\$(sudo rpcinfo -p | awk '{ if (\$3 ~ /tcp/ && \$5 ~ /mountd/) {print\$4;exit}}') && \
# export MOUNTUDP=\$(sudo rpcinfo -p | awk '{ if (\$3 ~ /udp/ && \$5 ~ /mountd/) {print\$4;exit}}') && \
# export NFS=\$(sudo rpcinfo -p | awk '{ if (\$3 ~ /tcp/ && \$5 ~ /nfs/) {print\$4;exit}}') && \
# export NLOCKTCP=\$(sudo rpcinfo -p | awk '{ if (\$3 ~ /tcp/ && \$5 ~ /nlockmgr/) {print\$4;exit}}') && \
# export NLOCKUDP=\$(sudo rpcinfo -p | awk '{ if (\$3 ~ /udp/ && \$5 ~ /nlockmgr/) {print\$4;exit}}') && \
# sudo iptables -I INPUT -p tcp --dport \$PORTMAPPER -j ACCEPT && \
# sudo iptables -I INPUT -p udp --dport \$PORTMAPPER -j ACCEPT && \
# sudo iptables -I INPUT -p tcp --dport \$STATUSTCP -j ACCEPT && \
# sudo iptables -I INPUT -p udp --dport \$STATUSUDP -j ACCEPT && \
# sudo iptables -I INPUT -p tcp --dport \$MOUNTTCP -j ACCEPT && \
# sudo iptables -I INPUT -p udp --dport \$MOUNTUDP -j ACCEPT && \
# sudo iptables -I INPUT -p tcp --dport \$NFS -j ACCEPT && \
# sudo iptables -I INPUT -p udp --dport \$NFS -j ACCEPT && \
# sudo iptables -I INPUT -p tcp --dport \$NLOCKTCP -j ACCEPT && \
# sudo iptables -I INPUT -p udp --dport \$NLOCKUDP -j ACCEPT && \
# sudo service iptables save
#   - sudo bash -c 'touch /etc/cloud/cloud-init.disabled'
#   - sudo bash -c 'systemctl poweroff'
# EOF

# echo "Creado archivo user-data4"

# cat > meta-data <<EOF
# instance-id: master-04
# EOF

# echo "Creado archivo user-metadata4"

# genisoimage  -output 4.iso -volid cidata -joliet -rock user-data meta-data

# echo "Creada imagen 4.iso"

# # ===========================================================================================

# #qemu-img create -f qcow2 vdb.qcow2 20G


# #qemu-img resize CentOS-Atomic-Host-GenericCloud.qcow2 +30G


# for i in 0 1 2 3 4
# do
   
#     virt-install --name master$i \
#                  --description 'Centos Atomic Host' \
#                  --check path_in_use=off \
#                  --ram 16204 --vcpus 4 \
#                  --disk path="CentOS-Atomic-Host-GenericCloud.qcow2",size=40 \
#                  --disk path="vdb.qcow2",size=20 \
#                  --os-type linux \
#                  --graphics spice \
#                  --os-variant centos7.0 \
#                  --network bridge=virbr0 \
#                  --noreboot \
#                  --cdrom "$i.iso"
# done

# # --check all=off \
# # ssh-keygen -q -N ""

# # ssh-keygen -f /home/origin/.ssh/id_rsa -t rsa -N ''

# # for i in origin@master.192.168.122.100 origin@node1.192.168.122.101  origin@node2.192.168.122.102
# # do
# #   ssh-copy-id -i /home/origin/.ssh/id_rsa.pub $i
# # done
