-----------------------------
--- ENVIRONMENT VARIABLES ---
-----------------------------

-- See https://wiki.hypr.land/Configuring/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_CURSOR_SIZE", "24")

hl.env("GTK_THEME", "Adwaita")
-- hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- XDG Specifications
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Nvidia
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
-- hl.env("NVD_BACKEND", "direct")
-- direct backend deadlocks decode in Firefox/Zen (NVDEC idle -> CPU VP9 4K -> throttle -> buffering). egl works.
hl.env("NVD_BACKEND", "egl")

hl.env("__GL_GSYNC_ALLOWED", "1")

-- Firefox
-- https://github.com/elFarto/nvidia-vaapi-driver#firefox
hl.env("MOZ_DISABLE_RDD_SANDBOX", "1")

-- Set nvidia as default render
hl.env("AQ_DRM_DEVICES", "/dev/dri/card2:/dev/dri/card1")
