# 删除部分文件
#rm -rf feeds/xiangfeidexiaohuo/patch/autocore
#rm -rf package/feeds/xiangfeidexiaohuo/luci-app-vssr

# 修改管理IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 修正连接数
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

# 修改主机名字
sed -i '/uci commit system/i\uci set system.@system[0].hostname='AX9000'' package/lean/default-settings/files/zzz-default-settings

# 添加pppoe拨号
sed -i '/exit/i\uci set network.wan.proto='pppoe'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci set network.wan.username='02201961545'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci set network.wan.password='961545'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci set network.wan.ifname='eth0'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci set network.wan6.ifname='eth0'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci commit network' package/lean/default-settings/files/zzz-default-settings

# 修改wifi设置
curl -fsSL https://raw.githubusercontent.com/hongcz1104/AX9000/main/mac80211.sh > package/kernel/mac80211/files/lib/wifi/mac80211.sh


# 取消bootstrap为默认主题，改为argon-18.06
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile

# 修改WiFi名称
sed -i 's/set wireless.default_radio${devidx}.ssid=OpenWrt/set wireless.default_radio0.ssid=Xiaomi 5G Game/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i '/set wireless.default_radio0.ssid=openwrtplus/a\set wireless.default_radio1.ssid=Xiaomi 5G' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i '/set wireless.default_radio1.ssid=Xiaomi 5G/a\set wireless.default_radio2.ssid=Xiaomi 2.4G' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改默认wifi密码
sed -i 's/encryption=none/encryption=psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i '/set wireless.default_radio${devidx}.encryption=psk2/a\set wireless.default_radio${devidx}.key=20130922' package/kernel/mac80211/files/lib/wifi/mac80211.sh
