

ssh root@192.168.0.103
# Setup SSH on arch:
pacman -S openssh
# if you want to change port or other config:
nano /etc/ssh/sshd_config

# Write down MAC address:
ip addr

# start ssh service and enable it on boot
systemctl start sshd
systemctl enable sshd

# Enable root login if needed
PermitRootLogin yes
# after config change need to restart:
systemctl restart sshd


# REF:
- connecting with ssh: " [ https://phoenixnap.com/kb/ssh-to-connect-to-remote-server-linux-or-windows ] "
"[ https://phoenixnap.com/kb/ssh-permission-denied-publickey#:~:text=If%20you%20want%20to%20use,login%20in%20the%20sshd_config%20file.&text=In%20the%20file%2C%20find%20the,disable%20it%20by%20adding%20no%20. ]"
