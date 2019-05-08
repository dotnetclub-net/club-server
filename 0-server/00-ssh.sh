
# server.com
# ssh-keygen
ssh-copy-id root@server.com

ssh root@server.com
sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config

systemctl restart sshd
