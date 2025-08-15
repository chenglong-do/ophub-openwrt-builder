#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/immortalwrt/immortalwrt / Branch: master
#========================================================================================================================

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# other
# rm -rf package/emortal/{autosamba,ipv6-helper}

# 替换原有的 luci-app-daed 和 daed 使用kixdaed
git clone -b master --depth 1 https://github.com/QiuSimons/luci-app-daed.git kixdaed
rm -rf feeds/luci/applications/luci-app-daed
rm -rf feeds/packages/net/daed
cp -rf kixdaed/luci-app-daed feeds/luci/applications/luci-app-daed
cp -rf kixdaed/daed feeds/packages/net/daed
rm -rf kixdaed

# Nikki with SmartGroup
git clone -b main --depth 1 https://github.com/msylgj/OpenWrt-nikki.git nikki
cp -rf nikki/luci-app-nikki feeds/luci/applications/luci-app-nikki
cp -rf nikki/nikki feeds/packages/net/nikki
ln -sf ../../../feeds/luci/applications/luci-app-nikki ./package/feeds/luci/luci-app-nikki
ln -sf ../../../feeds/packages/net/nikki ./package/feeds/packages/nikki
rm -rf nikki

# MOD Argon
rm -rf feeds/luci/themes/luci-theme-argon
git clone -b randomPic --depth 1 https://github.com/msylgj/luci-theme-argon.git feeds/luci/themes/luci-theme-argon

# 更换 Nodejs 版本
rm -rf feeds/packages/lang/node
git clone https://github.com/sbwml/feeds_packages_lang_node-prebuilt feeds/packages/lang/node

# Lucky
rm -rf package/lucky
git clone  https://github.com/gdy666/luci-app-lucky.git package/lucky

