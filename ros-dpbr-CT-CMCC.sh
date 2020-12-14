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

{
echo "/ip route rule"

nets=`cat ct.txt`
for net in $nets ; do
  echo "add dst-address=$net action=lookup table=CT"
done

nets=`cat cnc.txt`
for net in $nets ; do
  echo "add dst-address=$net action=lookup table=CT"
done

nets=`cat cmcc.txt`
for net in $nets ; do
  echo "add dst-address=$net action=lookup table=CMCC"
done

nets=`cat crtc.txt`
for net in $nets ; do
  echo "add dst-address=$net action=lookup table=CT"
done

nets=`cat cernet.txt`
for net in $nets ; do
  echo "add dst-address=$net action=lookup table=CT"
done

nets=`cat gwbn.txt`
for net in $nets ; do
  echo "add dst-address=$net action=lookup table=CT"
done

nets=`cat other.txt`
for net in $nets ; do
  echo "add dst-address=$net action=lookup table=CT"
done
} > ../ros-pbr-CT-CMCC.rsc 


{
echo "/ip firewall address-list"

nets=`cat ct.txt`
for net in $nets ; do
  echo "add list=dpbr-CT address=$net"
done

nets=`cat cnc.txt`
for net in $nets ; do
  echo "add list=dpbr-CT address=$net"
done

nets=`cat cmcc.txt`
for net in $nets ; do
  echo "add list=dpbr-CMCC address=$net"
done

nets=`cat crtc.txt`
for net in $nets ; do
  echo "add list=dpbr-CT address=$net"
done

nets=`cat cernet.txt`
for net in $nets ; do
  echo "add list=dpbr-CT address=$net"
done

nets=`cat gwbn.txt`
for net in $nets ; do
  echo "add list=dpbr-CT address=$net"
done

nets=`cat other.txt`
for net in $nets ; do
  echo "add list=dpbr-CT address=$net"
done
} > ../ros-dpbr-CT-CMCC.rsc 

cd ..
rm -rf ./pbr
