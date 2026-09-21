# TODOs:
## Features
- [X] Add: Basic status & task bar
- [X] Add: System tray menu
- [X] Add: Wallpaper-switcher module
- [X] Add: Add a control for opening upp the wallpaper switcher
- [ ] Add: Settings menu
- [ ] Add: Calendar display widget
- [ ] Add: Weather display widget
- [ ] Add: Controls for screen record, screenshot, etc
- [ ] Add: Notification popups (for certain desktop actions)
- [ ] Add: Changing the theme on-the-fly (panel colors & accent colors, sync with wallpaper average color or with desired color-theme)

## Changes
- [X] Improve: pick new colors
- [X] Refactor: Make the QML data services slightly more robust
- [X] Improve: Add keyboard controls to powermenu
- [X] Improve: powermenu needs a small UI overhaul
- [X] Improve: powermenu is missing a button for logging out
- [X] Improve: wallpaperswitcher needs keyboard controls
- [X] Improve: Settle on a consistent look for the dropdown trays/sliders
- [X] Improve: Status bar gradients need to be adjusted to be more subtle.
- [ ] Improve: BrightnessService.qml - implement hardware-dimming controls (preferred for laptops)
- [ ] Improve: Look into styling the context menus for system tray items.
- [ ] Improve: WallpaperService needs to be aware of currently selected wallpaper
- [ ] Improve: Wallpaper carousel items to be displayed as slanted paralellograms
- [ ] Improve: Add a selector for which monitor the wallpaper is being set for
- [ ] Improve: Add support for vertical/horizontal screens to wallpaperswitcher
- [ ] Improve: How UI scale factor is determined
  - [X] Account for monitor height
  - [ ] Account for display ratio
- [ ] Refactor: The logic for how the wallpaper carousel PathView is sized (hard to read)
- [ ] Improve: Do a post-feature-implementation UI overhaul

## Bugs/Issues
- [X] Bug: The clock widget freezes sometimes.
- [X] Bug: The brightness control is not always in sync with the nightlight.
- [X] Bug: System tray item context menus not opening (may be related to focus grab behaviour)
- [X] Issue: Battery indicator is visually inconsistent with the rest of the indicators
- [X] Issue: Fix problem with Quickshell.screens & multimonitor setups
- [ ] Issue: SystemDataService.qml needs a better implementation for how mountpoints are specified (needs checks for example).
- [ ] Issue: Brightness service needs to react to the hyprsunset schedule
- [ ] Issue: Implement fix for certain font icons which are visually off-center compared to other icons (its font-related)

## Ideas (undeveloped/more long-term):
- [ ] Add: Integrated controls for audio devices
- [ ] Add: Integrated controls for wifi/lan connections
- [ ] Add: Integrated controls for RGB (OpenRGB?). Sync colors with current theme?
- [ ] Add: Integrated media/playback controls (at least spotify integration)
- [ ] Add: Integrated clipboard history (or just add a toggle for the current rofi cliphist implementation)
- [ ] Add: Custom notification display (currently using swaync)?
