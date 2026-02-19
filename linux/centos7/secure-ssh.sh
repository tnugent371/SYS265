#secure-ssh.sh
#author tnugent371
#creates a new ssh user using $1 perameter
#adds a public key from the local repo or curled from the local repo
#removes roots ability to ssh in

USERNAME=$1

sudo useradd -m -d /home/$USERNAME -s /bin/bash $USERNAME

sudo mkdir /home/$USERNAME/.ssh
sudo cp SYS265/linux/public-keys/id_rsa.pub /home/$USERNAME/.ssh/authorized_keys
sudo chmod 700 /home/$USERNAME/.ssh
sudo chmod 600 /home/$USERNAME/.ssh/authorized_keys

sudo chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh

sudo sed -i 's/^#*PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config

sudo systemctl restart sshd

echo "User $USERNAME created and SSH securrd"
