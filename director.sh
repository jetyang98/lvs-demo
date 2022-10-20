sudo apt-get -y install net-tools

#由于内核已集成ipvs模块，只需要安装ipvsadm即可
sudo apt-get -y install ipvsadm

#在director上建立一个虚拟的ip地址进行消息广播
sudo ifconfig enp0s8:0 172.20.10.10 netmask 255.255.255.240

#将虚拟地址添加到路由表，不添加也可以
# sudo route add -host 172.20.10.10 dev enp0s8:0

#使用ipvsadm安装LVS服务
sudo ipvsadm -A -t 172.20.10.10:80 -s rr

#增加真实服务器
sudo ipvsadm -a -t 172.20.10.10:80 -r 172.20.10.6:80
sudo ipvsadm -a -t 172.20.10.10:80 -r 172.20.10.7:80
