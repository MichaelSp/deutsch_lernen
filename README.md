# What is it?

A small WiFi device that gives access to videos from a USB-Stick. Used for learning german by videos in refugee camps.

# Requirements

Buy a [Hootoo TripMate Nano HT TM2](http://www.hootoo.com/hootoo-tripmate-nano-ht-tm02-wireless-portable-router.html) and a USB-Stick.

# Installation

Flash: `openwrt/openwrt-ramips-rt305x-ht-tm02-squashfs-factory-r42649.bin`
Upgrade `openwrt/openwrt-15.05-ramips-rt305x-ht-tm02-squashfs-sysupgrade.bin`

## Package Sources

```
src/gz chaos_calmer_base http://downloads.openwrt.org/chaos_calmer/15.05/ramips/rt305x/packages/base
src/gz chaos_calmer_luci http://downloads.openwrt.org/chaos_calmer/15.05/ramips/rt305x/packages/luci
src/gz chaos_calmer_management http://downloads.openwrt.org/chaos_calmer/15.05/ramips/rt305x/packages/management
src/gz chaos_calmer_packages http://downloads.openwrt.org/chaos_calmer/15.05/ramips/rt305x/packages/packages
src/gz chaos_calmer_routing http://downloads.openwrt.org/chaos_calmer/15.05/ramips/rt305x/packages/routing
src/gz chaos_calmer_telephony http://downloads.openwrt.org/chaos_calmer/15.05/ramips/rt305x/packages/telephony
```

# Install Packages

`opkg update && opkg install kmod-usb-storage block-mount kmod-fs-ext4 luci-app-minidlna` 

## Configuration

In the backup `backup-deutsch-2015-12-16.tar.gz`:
 * replace public key in `/etc/dropbear/authorized_keys`
 * replace password in `/etc/shadow`
 
Apply backup: `backup-deutsch-2015-12-16.tar.gz`

# Pages

 * Copy contents of `www` to `/www`
 * `ln -s /mnt/sda1/videos/ /www/videos`