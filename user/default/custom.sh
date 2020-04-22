#!/bin/bash

echo "Test custom.sh"

./scripts/feeds update -a
./scripts/feeds install -a

#修改openwrt_release版本
sed -i 's#R[0-9].*\('\''\)#R20.4.20\1#g'   package/lean/default-settings/files/zzz-default-settings
sed -i 's/https:/R20.4.20/g' package/lean/default-settings/files/zzz-default-settings
sed -i 's/http:/snapshots/g' package/lean/default-settings/files/zzz-default-settings
sed -i 's/openwrt.proxy.ustclug.org/op.hyird.xyz/g' package/lean/default-settings/files/zzz-default-settings
#去除密码
sed  -i '/^sed.*shadow$/d'  package/lean/default-settings/files/zzz-default-settings

#添加一些软件包
git clone https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-adguardhome
git clone https://github.com/destan19/OpenAppFilter package/OpenAppFilter
git clone https://github.com/Mrbai98/luci-theme-atmaterial.git package/luci-theme-atmaterial
git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan
 
