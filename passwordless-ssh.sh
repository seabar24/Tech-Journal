echo -n "Enter a username: "
read user

sudo adduser --disabled-password $user
sudo mkdir /home/$user/.ssh
sudo touch /home/$user/.ssh/authorized_keys
sudo chown -R $user:$user /home/$user/.ssh
sudo chmod 700 /home/$user/.ssh
sudo chmod 600 /home/$user/.ssh/authorized_keys

#Make sure you have the public key copied over from the machine you want to ssh from into this machine. 
#And make sure it ends with .pub
sudo cp *.pub /home/$user/.ssh/authorized_keys

echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
systemctl restart sshd
