#secure-ssh.sh
#author tnugent371
#creates a new ssh user using $1 perameter
#adds a public key from the local repo or curled from the local repo
#removes roots ability to ssh in

USERNAME=$1
PUBKEY_FILE="public-keys/id_rsa.pub"

sudo useradd -m -s /bin/bash $USERNAME

sudo mkdir -p /home/$USERNAME/.ssh/authorized_keys
sudo chmod 600 /home/$USERNAME/.ssh/authorized_keys

sudo chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh

sudo sed -i 's/^#*PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config

sudo systemctl restart sshd

echo "User $USERNAME created and SSH securrd"
