# My desktop shell
This is my custom Quickshell shell for my desktop environment. It is still early in development with a few bugs and a UI that is very basic and needs improvements in many aspects.

## Important notes!
This shell is intended to be used in conjunction with my personal NixOS configuration which uses the Hyprland compositor. This Quickshell configuration has actually been split of of my main NixOS repository. This does mean that, at least in this early stage, this configuration is making several assumptions about the underlying system configuration. This config will, at the very least, always assume that the system is running NixOS/Hyprland.

My personal NixOS repository is not yet public, as it is essentially an amalgam of my own code as well as various examples and configs that I have found online and adapted for my own use. In short, I still need to clean it up, refactor it and add the proper license attributions to it before it can be made public.

I will update this with details on usage once my other repository is public.

### What the current config assumes about the underlying system
I.e "what the config interfaces with / depends on for some functionality"

Some of these can be easily changed by editing the config
- upower (for the battery-indicator for laptops)
- swaync (for the notification-panel)
- pavucontrol (for audio-device configuration)
- hyprpaper (for the wallpaper-switcher)
- hyprsunset (for software-dimming)
- SOON: brightnessctl (for hardware-dimming)

(subject to change of course)