@REM 新建一个lvs服务器,两个web服务器
multipass launch -n director --network WLAN lts

multipass launch -n openresty1 --network WLAN lts

multipass launch -n openresty2 --network WLAN lts

multipass launch -n server1 --network WLAN lts

multipass launch -n server2 --network WLAN lts
