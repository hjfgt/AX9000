# 删除部分文件
rm -rf feeds/xiangfeidexiaohuo/patch/autocore
rm -rf package/feeds/xiangfeidexiaohuo/luci-app-vssr

# 修改管理IP
sed -i 's/192.168.1.1/10.10.10.1/g' package/base-files/files/bin/config_generate

# 修正连接数
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# 修改root密码
sed -i 's/V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0/bt44IxMu$i4NgW46.Dpkm5VCZeffEL0:18984/g' package/lean/default-settings/files/zzz-default-settings

# 版本号里添加信息
sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION='By HONGCZ $(TZ=UTC-8 date +%Y%m%d)'/g" package/lean/default-settings/files/zzz-default-settings

# 修改主机名字为AX3600
sed -i '/uci commit system/i\uci set system.@system[0].hostname='AX3600'' package/lean/default-settings/files/zzz-default-settings

# 添加pppoe拨号
sed -i '/exit/i\uci set network.wan.proto='pppoe'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci set network.wan.username='07521205834879'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci set network.wan.password='123456780'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci set network.wan.ifname='eth0'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci set network.wan6.ifname='eth0'' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\uci commit network' package/lean/default-settings/files/zzz-default-settings

# 替换私人设置
curl -fsSL https://raw.githubusercontent.com/hongcz1104/OPENWRT-AX3600/config/mac80211.sh > package/kernel/mac80211/files/lib/wifi/mac80211.sh
curl -fsSL https://raw.githubusercontent.com/hongcz1104/OPENWRT-AX3600/config/ddnsto.config > feeds/xiangfeidexiaohuo/nas/ddnsto/files/ddnsto.config
#curl -fsSL https://raw.githubusercontent.com/hongcz1104/OPENWRT-AX3600/config/openclash > package/lean/luci-app-openclash/root/etc/config/openclash
curl -fsSL https://raw.githubusercontent.com/hongcz1104/OPENWRT-AX3600/config/unblockmusic > package/lean/luci-app-unblockmusic/root/etc/config/unblockmusic
curl -fsSL https://raw.githubusercontent.com/hongcz1104/OPENWRT-AX3600/config/aliyundrive-webdav.config > feeds/xiangfeidexiaohuo/aliyun/aliyundrive-webdav/files/aliyundrive-webdav.config
curl -fsSL https://raw.githubusercontent.com/hongcz1104/OPENWRT-AX3600/config/cpufreq > feeds/xiangfeidexiaohuo/luci-app-cpufreq/root/etc/config/cpufreq
curl -fsSL https://raw.githubusercontent.com/hongcz1104/OPENWRT-AX3600/config/autotimeset > feeds/xiangfeidexiaohuo/luci-app-autotimeset/root/etc/config/autotimeset

# 取消bootstrap为默认主题，改为argon-18.06
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci-nginx/Makefile
