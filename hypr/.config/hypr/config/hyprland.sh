#!/bin/sh
# https://github.com/CachyOS/cachyos-hyprland-settings/blob/master/etc/profile.d/Hyprland.sh

if [ -d /sys/module/nvidia ] && [ ! -d /sys/module/i915 ] && [ ! -d /sys/module/amdgpu ]; then
    export GBM_BACKEND=nvidia-drm
    export EGL_PLATFORM=wayland
fi
