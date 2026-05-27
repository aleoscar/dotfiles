hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- screenshot customization
hl.env("SLURP_ARGS", "-d -b -B F050F022 -b 10101022 -c ff00ff")
hl.env("XDG_SCREENSHOTS_DIR", "/home/sanej/Pictures/Screenshots")

hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("GDK_SCALE", "2")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("XDG_MENU_PREFIX", "arch-")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Nvidia stuff
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
