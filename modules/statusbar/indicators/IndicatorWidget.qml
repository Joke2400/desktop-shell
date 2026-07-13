import qs.config.style
import qs.components
import qs.services

import Quickshell.Hyprland

Tray {
    id: root

    innerSpacing: Constant.spacingMedium
    implicitHeight: Constant.barHeight + Constant.paddingSmall * 2

    Indicator {
        id: cpuIndicator
        buttonIcon: ""
        buttonText: isToggled ? SystemDataService.cpuFreqGHz + "GHz" : SystemDataService.cpuPercent.toFixed(1) + "%"
        tooltipText: "CPU Usage"
        onRightClicked: () => {
            Hyprland.dispatch("exec [float; center; size 1000 700] kitty --override font_size=12 --title float_kitty btop");
        }
    }
    Indicator {
        id: memIndicator
        buttonIcon: ""
        buttonText: isToggled ? SystemDataService.memUsedGB + "GB" : SystemDataService.memPercent.toFixed(1) + "%"
        tooltipText: "Memory Usage"
        onRightClicked: () => {
            Hyprland.dispatch("exec [float; center; size 1000 700] kitty --override font_size=12 --title float_kitty btop");
        }
    }
    Indicator {
        id: diskIndicator
        buttonIcon: "󰋊"
        buttonText: isToggled ? (SystemDataService.diskUsedGB / 1024).toFixed(2) + "TB/" + (SystemDataService.diskTotalGB / 1024).toFixed(2) + "TB" : SystemDataService.diskPercent.toFixed(1) + "%"
        tooltipText: "Disk Usage"
        onRightClicked: () => {
            Hyprland.dispatch("exec [float; center; size 1000 700] gnome-disks");
        }
    }
}
