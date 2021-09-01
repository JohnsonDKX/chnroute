#!/bin/sh
mkdir -p ./pbr
cd ./pbr

#电信
wget --no-check-certificate -c -O ct.txt https://ispip.clang.cn/chinatelecom_cidr.txt
#联通
wget --no-check-certificate -c -O cnc.txt https://ispip.clang.cn/unicom_cnc_cidr.txt
#移动
wget --no-check-certificate -c -O cmcc.txt https://ispip.clang.cn/cmcc_cidr.txt
#铁通
wget --no-check-certificate -c -O crtc.txt https://ispip.clang.cn/crtc_cidr.txt
#教育网
wget --no-check-certificate -c -O cernet.txt https://ispip.clang.cn/cernet_cidr.txt
#长城宽带/鹏博士
wget --no-check-certificate -c -O gwbn.txt https://ispip.clang.cn/gwbn_cidr.txt
#其他
wget --no-check-certificate -c -O other.txt https://ispip.clang.cn/othernet_cidr.txt
#中国
wget --no-check-certificate -c -O chn.txt https://ispip.clang.cn/all_cn.txt
#电信ipv6
wget --no-check-certificate -c -O ct_ipv6.txt https://ispip.clang.cn/chinatelecom_ipv6.txt
#联通ipv6
wget --no-check-certificate -c -O cnc_ipv6.txt https://ispip.clang.cn/unicom_cnc_ipv6.txt
#移动ipv6
wget --no-check-certificate -c -O cmcc_ipv6.txt https://ispip.clang.cn/cmcc_ipv6.txt
#铁通ipv6
wget --no-check-certificate -c -O crtc_ipv6.txt https://ispip.clang.cn/crtc_ipv6.txt
#教育网ipv6
wget --no-check-certificate -c -O cernet_ipv6.txt https://ispip.clang.cn/cernet_ipv6.txt
#长城宽带/鹏博士ipv6
wget --no-check-certificate -c -O gwbn_ipv6.txt https://ispip.clang.cn/gwbn_ipv6.txt
#其他ipv6
wget --no-check-certificate -c -O other_ipv6.txt https://ispip.clang.cn/othernet_ipv6.txt
#中国ipv6
wget --no-check-certificate -c -O chn_ipv6.txt https://ispip.clang.cn/all_cn_ipv6.txt

{
echo "/ip firewall address-list"

for net in $(cat ct.txt) ; do
  echo "add list=dpbr-CT address=$net"
done

for net in $(cat cnc.txt) ; do
  echo "add list=dpbr-CT address=$net"
done

for net in $(cat cmcc.txt) ; do
  echo "add list=dpbr-CMCC address=$net"
done

for net in $(cat crtc.txt) ; do
  echo "add list=dpbr-CMCC address=$net"
done

for net in $(cat cernet.txt) ; do
  echo "add list=dpbr-CT address=$net"
done

for net in $(cat gwbn.txt) ; do
  echo "add list=dpbr-CT address=$net"
done

for net in $(cat other.txt) ; do
  echo "add list=dpbr-CT address=$net"
done
} > ../ros-dpbr-CT-CMCC.rsc 

{
echo "/ip firewall address-list"

for net in $(cat chn.txt) ; do
  echo "add list=novpn address=$net"
done
} > ../ros-dpbr-CHN.rsc 

{
echo "/ip firewall address-list"

for net in $(cat ct_ipv6.txt) ; do
  echo "add list=ctcc_ipv6 address=$net"
done

for net in $(cat cnc_ipv6.txt) ; do
  echo "add list=ctcc_ipv6 address=$net"
done

for net in $(cat cmcc_ipv6.txt) ; do
  echo "add list=cmcc_ipv6 address=$net"
done

for net in $(cat crtc_ipv6.txt) ; do
  echo "add list=cmcc_ipv6 address=$net"
done

for net in $(cat cernet_ipv6.txt) ; do
  echo "add list=ctcc_ipv6 address=$net"
done

for net in $(cat gwbn_ipv6.txt) ; do
  echo "add list=ctcc_ipv6 address=$net"
done

for net in $(cat other_ipv6.txt) ; do
  echo "add list=ctcc_ipv6 address=$net"
done
} > ../ros-dpbr-CT-CMCC-IPV6.rsc 

for net in $(cat chn_ipv6.txt) ; do
  echo "add list=novpn_ipv6 address=$net"
done
} > ../ros-dpbr-CHN-IPV6.rsc 

cd ..
rm -rf ./pbr
