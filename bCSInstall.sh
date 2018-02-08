#!/bin/bash
# Install packages
sudo apt-get install curlftpfs sshfs fuse

# Prepare directory
sudo mkdir $HOME/mnt
sudo chmod -R 775 $HOME/mnt

# Prepare cron
crontab -l > tmpCron
echo "@reboot rm -rf $HOME/mnt/*" >> tmpCron
crontab tmpCron
rm tmpCron

# Prepare sudoers
#sudo echo "" >> /etc/sudoers
#sudo echo "# Custom user credentials" >> /etc/sudoers
#sudo echo "$USER ALL=(ALL)NOPASSWD: /bin/umount" >> /etc/sudoers
sudo addgroup $USER fuse

