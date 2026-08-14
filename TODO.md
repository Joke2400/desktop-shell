# TODOs:
## Features
- [X] Add: Basic status & task bar
- [X] Add: System tray menu
- [ ] Add: Wallpaper-switcher module
- [ ] Add: Calendar display widget
- [ ] Add: Weather display widget
- [ ] Add: Controls for screen record, screenshot, etc
- [ ] Add: Notification popups (for certain desktop actions)
- [ ] Add: Changing the theme on-the-fly (sync with wallpaper)
- [ ] Add: Add a control for opening upp the wallpaper switcher

## Changes
- [X] Improve: pick new colors
- [X] Refactor: Make the QML data services slightly more robust
- [ ] Improve: BrightnessService.qml - implement hardware-dimming controls (preferred for laptops)
- [ ] Improve: dynamic accent colors based on wallpaper?
- [ ] Improve: Add keyboard controls to powermenu
- [ ] Improve: powermenu needs a small UI overhaul
- [ ] Improve: Do a post-feature-implementation UI overhaul
- [ ] Improve: Look into styling the context menus for system tray items.
- [ ] Improve: powermenu is missing a button for logging out
- [ ] Improve: wallpaperswitcher needs keyboard controls
- [ ] Improve: WallpaperService needs to be aware of current wallpaper

## Bugs/Issues
- [X] Bug: The clock widget freezes sometimes.
- [X] Bug: The brightness control is not always in sync with the nightlight.
- [X] Bug: System tray item context menus not opening (may be related to focus grab behaviour)
- [ ] Issue: SystemDataService.qml needs a better implementation for how mountpoints are specified (needs checks).
- [ ] Issue: Battery indicator is visually inconsistent with the rest of the indicators
- [ ] Issue: Brightness service needs to react to hyprsunset schedule
- [ ] Issue: Implement fix for certain font icons which are visually off-center compared to other icons

## Ideas (undeveloped/more long-term):
- [ ] Add: Integrated controls for audio devices
- [ ] Add: Integrated controls for wifi/lan connections
- [ ] Add: Integrated controls for RGB (OpenRGB?). Sync colors with current theme?
- [ ] Add: Integrated media/playback controls (at least spotify integration)
- [ ] Add: Integrated clipboard history (or just add a toggle for the current rofi cliphist implementation)
- [ ] Add: Custom notification display (currently using swaync)?
