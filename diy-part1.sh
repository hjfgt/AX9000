##添加自己的插件库

rm -rf ./package/lean/luci-theme-argon
rm -rf ./package/lean/aliyundrive-webdav
rm -rf ./package/lean/luci-app-aliyundrive-webdav
rm -rf ./package/lean/go-aliyundrive-webdav
rm -rf ./package/lean/luci-app-go-aliyundrive-webdav
rm -rf ./package/lean/luci-app-cpufreq
rm -rf ./package/lean/luci-app-kodexplorer
  
# 添加插件库
echo -e "\nsrc-git xiangfeidexiaohuo https://github.com/xiangfeidexiaohuo/openwrt-packages" >> feeds.conf.default

svn checkout  https://github.com/vernesong/OpenClash/branches/dev/luci-app-openclash ./package/lean/luci-app-openclash
