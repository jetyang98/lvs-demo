sudo apt-get -y install net-tools

# 安装OpenResty
sudo apt-get -y install --no-install-recommends wget gnupg ca-certificates
sudo wget -O - https://openresty.org/package/pubkey.gpg | sudo apt-key add -
echo "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main" \
 | sudo tee /etc/apt/sources.list.d/openresty.list
sudo apt-get update
sudo apt-get -y install openresty

# 开启nginx
sudo /usr/local/openresty/nginx/sbin/nginx -s stop
cd work
sudo /usr/local/openresty/nginx/sbin/nginx -p `pwd`

# 添加虚拟网卡
sudo ifconfig lo:0 172.20.10.10 netmask 255.255.255.255

# 不添加也可以
# sudo route add -host 172.20.10.10 dev lo:0

# 关闭ARP应答，即没有缓存的无法得到MAC地址
sudo bash -c "echo 1 > /proc/sys/net/ipv4/conf/lo/arp_ignore"
sudo bash -c "echo 2 > /proc/sys/net/ipv4/conf/lo/arp_announce"
sudo bash -c "echo 1 > /proc/sys/net/ipv4/conf/all/arp_ignore"
sudo bash -c "echo 2 > /proc/sys/net/ipv4/conf/all/arp_announce"
