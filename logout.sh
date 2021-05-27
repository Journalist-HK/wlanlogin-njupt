#!/bin/sh

WAN_INTERFACE=$(uci get "network.wan.ifname")

if [ -n "$WAN_INTERFACE" ]; then
  WAN_INTERFACE="dev $WAN_INTERFACE"
fi

local_ip=`ip -4 addr list dev $(uci get "network.wan.ifname") | grep "global" | sed -n 's/.*inet \([0-9.]\+\).*/\1/p' | head -n 1` #detect ip

curl "http://10.10.244.11:801/eportal/?c=ACSetting&a=Logout&protocol=http:&hostname=10.10.244.11&iTermType=1&wlanacname=XL-BRAS-SR8806-X&mac=&ip=$local_ip&enAdvert=0&queryACIP=0" \
  -H 'Connection: keep-alive' \
  -H 'Cache-Control: max-age=0' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Origin: http://10.10.244.11' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Referer: http://10.10.244.11/' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en-CN;q=0.8,en;q=0.7' \
  -H 'Cookie: program=2; vlan=0; ssid=null; areaID=null; ip=$local_ip' \
  --insecure
