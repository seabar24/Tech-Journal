#secure-ssh.sh
#author seabar24
#creates a new ssh user using $1 parameter
#adds a public key from the local repo or curled from the remote repo
#removes roots ability to ssh in
echo -n "Enter the username: "
read username

pubkeyloc=Tech-Journal/SYS265/linux/public-keys/id_rsa.pub

userauthkey=/home/"$username"/.ssh/authorized_keys

sudo useradd -m -d /home/"$username" -s /bin/bash "$username"
sudo mkdir /home/"$username"/.ssh
sudo cp $pubkeyloc $userauthkey
sudo chmod 700 /home/"$username"/.ssh
sudo chmod 600 /home/"$username"/.ssh/authorized_keys
sudo chown -R "$username":"$username" /home/"$username"/.ssh

