#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9385984 88199a8622db14345958da918f8cff1dd4b3138d 7155712 3fec1e7693d08364607447b05ab1574d87116ed5
fi

if ! applypatch -c EMMC:/dev/block/platform/sdhci-tegra.3/by-name/SOS:9385984:88199a8622db14345958da918f8cff1dd4b3138d; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/sdhci-tegra.3/by-name/LNX:7155712:3fec1e7693d08364607447b05ab1574d87116ed5 EMMC:/dev/block/platform/sdhci-tegra.3/by-name/SOS 88199a8622db14345958da918f8cff1dd4b3138d 9385984 3fec1e7693d08364607447b05ab1574d87116ed5:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
