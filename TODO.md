# TODOs:
## Features
- [X] Add: Basic status & task bar
- [ ] Add: Wallpaper-switcher module
- [ ] Add: Calendar display widget
- [ ] Add: Weather display widget
- [ ] Add: Controls for screen record, screenshot, etc
- [ ] Add: Notification popups (for certain desktop actions)
- [ ] Add: SystemTray menu
- [ ] Add: Changing the theme on-the-fly (sync with wallpaper)

## Changes
- [ ] Improve: BrightnessService.qml - implement hardware-dimming controls (preferred for laptops)
- [X] Improve: pick new colors
- [ ] Improve: dynamic accent colors based on wallpaper?
- [X] Refactor: Make the QML data services slightly more robust
- [ ] Improve: Add keyboard controls to powermenu
- [ ] Improve: powermenu needs a small UI overhaul
- [ ] Improve: Do a post-feature-implementation UI overhaul

## Bugs/Issues
- [X] Bug: The clock widget freezes sometimes.
- [X] Bug: The brightness control is not always in sync with the nightlight.
- [ ] Issue: SystemDataService.qml needs a better implementation for how mountpoints are specified (needs checks).
- [ ] Issue: Battery indicator is visually inconsistent with the rest of the indicators
- [ ] Bug: Context menu doesn't open when system tray items are clicked
- [ ] Bug: System tray item context menus not opening (may be related to focus grab behaviour)
- [ ] Issue: Brightness service needs to react to hyprsunset schedule

## Ideas (undeveloped/more long-term):
- [ ] Add: Integrated controls for audio devices
- [ ] Add: Integrated controls for wifi/lan connections
- [ ] Add: Integrated controls for RGB (OpenRGB?). Sync colors with current theme?
- [ ] Add: Integrated media/playback controls (at least spotify integration)
- [ ] Add: Integrated clipboard history (or just add a toggle for the current rofi cliphist implementation)
- [ ] Add: Custom notification display (currently using swaync)?
- [ ] Add: Ability to modify certain simple NixOS settings through the quickshell shell itself?
  - This does go against how NixOS is designed, but i'm currently sharing my computer with others in the household
  - Highly likely i will skip doing this, as it would require quite heavy integration with my config
