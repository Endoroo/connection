#!/bin/bash

# Enter basic settings
echo "Hello, dear friend! For creation script you should type some information here."
echo "------------------------------------------------------------------------------"
echo "Enter sitename (for example, www.localhost.com):"
read site
echo "Enter connction protocol (ftp or ssh):"
read protocol
echo "Enter hostname (for example, ssh.localhost.com):"
read host
echo "Enter username:"
read user
echo "Enter password:"
read pswd

# Create & prepare connection script
bCSPath="./scripts/$protocol_$site"
rm -rf $bCSPath
cp ./bCSTemplate $bCSPath
sed -i "s/_HOSTNAME_/$host/g" $bCSPath
sed -i "s/_SITENAME_/$site/g" $bCSPath
sed -i "s/_USERNAME_/$user/g" $bCSPath
sed -i "s/_PASSWORD_/$pswd/g" $bCSPath
sed -i "s/_PROTOCOL_/$protocol/g" $bCSPath

if [ "$protocol" = "ftp" ]; then
	util="curlftpfs"
else
	util="sshfs"
fi 
sed -i "s/_UTILITY_/$util/g" $bCSPath
chmod +x $bCSPath
