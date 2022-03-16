#! /bin/sh

alpineprofile="profile_standard"
kernel_cmdline="unionfs_size=512M console=tty0 console=ttyS0,115200"
serialport="0"
serialbaudrate="115200"
kernel_addons=""
custom_apks="libvirt-daemon qemu-img qemu-system-x86_64 qemu-modules openrc virt-install"
apkovl="genapkovl-kvmhost.sh"
hostname="alpinekvmhost"

echo "Alpine KVM Host Image Profile"

profile_kvmhost() {
  $alpineprofile
  kernel_cmdline="$kernel_cmdline"
  syslinux_serial="$serialport $serialbaudrate"
  kernel_addons="$kernel_addons"
  apks="$apks $custom_apks"
  apkovl="$apkovl"
  hostname="$hostname"
  local _k _a
  for _k in $kernel_flavors; do
    apks="$apks linux-$_k"
    for _a in $kernel_addons; do
      apks="$apks $_a-$_k"
    done
  done
  apks="$apks linux-firmware"
  echo "APKS: $apks"
}

