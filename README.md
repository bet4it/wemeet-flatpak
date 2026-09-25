# Tencent Meeting (Wemeet) Flatpak

Flatpak packaging for Tencent Meeting (腾讯会议, `com.tencent.wemeet`), configured for Wayland and XWayland with Wayland screen sharing support and drop shadow crash bypass.

## Features

- **Wayland Screen Sharing**: Bundled with [wemeet-wayland-screenshare](https://github.com/DerryAlex/wemeet-wayland-screenshare) hook (`/app/lib/wemeet/libhook.so`).
- **Drop Shadow Crash Fix**: Binary-patched `QGraphicsDropShadowEffect::draw` in bundled Qt5 to bypass the `SIGSEGV` crash when joining meetings or opening dialogs on modern Linux graphics stacks.
- **Wayland EGL Protection**: Automatically unsets `EGL_PLATFORM` to avoid Mesa EGL startup crashes on GNOME Wayland sessions.

## Installation

### Add Repository

```bash
# Add repository
flatpak remote-add --user --if-not-exists wemeet https://bet4it.github.io/wemeet-flatpak/wemeet.flatpakrepo

# Install Tencent Meeting
flatpak install --user wemeet com.tencent.wemeet
```

### Or install via Flatpakref

```bash
flatpak install --user https://bet4it.github.io/wemeet-flatpak/com.tencent.wemeet.flatpakref
```

## Options & Overrides

### Screen Share Hook

The Wayland screen share hook is enabled by default via `LD_PRELOAD`.

To disable the hook:
```bash
flatpak override --user --unset-env=LD_PRELOAD com.tencent.wemeet
```

To re-enable:
```bash
flatpak override --user --env=LD_PRELOAD=/app/lib/wemeet/libhook.so com.tencent.wemeet
```
