# 修改管理IP
sed -i 's/10.10.10.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 修正连接数
sed -i 's/65535/165535/g' package/base-files/files/etc/sysctl.conf

# 版本号里添加编译日期
sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION='By HONGCZ $(TZ=UTC-8 date +%Y%m%d)'/g" package/lean/default-settings/files/zzz-default-settings

# 修改主机名字
sed -i '/uci commit system/i\uci set system.@system[0].hostname='AX9000'' package/lean/default-settings/files/zzz-default-settings

# 添加pppoe拨号
sed -i '/exit/i\uci set network.wan.proto='pppoe'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci set network.wan.username='02201961545'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci set network.wan.password='961545'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci set network.wan.ifname='eth0'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci set network.wan6.ifname='eth0'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci commit network' package/lean/default-settings/files/zzz-default-settings

# 修改WiFi名称
sed -i 's/radio0.ssid=OpenWrt_2.4G/radio0.ssid=Xiaomi 5G Game/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/radio1.ssid=OpenWrt_5G/radio1.ssid=Xiaomi 5G/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i '/radio1.ssid=Xiaomi 5G/a\set wireless.default_radio2.ssid=Xiaomi 2.4G' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改默认wifi密码
sed -i 's/encryption=sae-mixed/encryption=psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/key=1234567890/key=20130922/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 取消bootstrap为默认主题，改为argon-18.06
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci-nginx/Makefile
