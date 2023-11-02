clear
chmod 777 /etc/apt/apt.conf.d/10periodic
cp /etc/apt/apt.conf.d/10periodic ~/Desktop/backups/
echo "APT::Periodic::Update-Package-Lists \"1\";\nAPT::Periodic::Download-Upgradeable-Packages \"1\";\nAPT::Periodic::AutocleanInterval \"1\";\nAPT::Periodic::Unattended-Upgrade \"1\";" > /etc/apt/apt.conf.d/10periodic
chmod 644 /etc/apt/apt.conf.d/10periodic
echo "auto updating has been enabled."

apt update -y
apt upgrade -y
apt dist-upgrade -y
print "updated packages."

apt autoremove -y
apt autoclean -y
apt clean -y
echo "cleaned and removed unessecary packages."

apt install ufw -y
ufw enable

apt install clamav clamav-freshclam -y
freshclam
clamscan -r --bell -i /