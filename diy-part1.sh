##添加自己的插件库

rm -rf ./package/lean/luci-theme-argon
rm -rf ./package/lean/aliyundrive-webdav
rm -rf ./package/lean/luci-app-aliyundrive-webdav
rm -rf ./package/lean/luci-app-go-aliyundrive-webdav
rm -rf ./package/lean/luci-app-cpufreq
  
# 添加插件库
echo -e "\nsrc-git kiddin9 https://github.com/kiddin9/openwrt-packages" >> feeds.conf.default

