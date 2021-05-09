#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:8414137801e8faabef705a31130539ee35b1e405; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:e273b4ff3f9fee751f5f16ce967c66aa88dc0860 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:8414137801e8faabef705a31130539ee35b1e405 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
