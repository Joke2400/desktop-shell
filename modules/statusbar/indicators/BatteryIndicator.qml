import qs.services

BarIndicator {
    text: {
        if (BatteryService.isFull)
            return "󰂄";
        if (BatteryService.percentage < 15) {
            return BatteryService.isCharging ? "󰢟" : "󰂎";
        } else if (BatteryService.percentage < 33) {
            return BatteryService.isCharging ? "󱊤" : "󱊡";
        } else if (BatteryService.percentage < 66) {
            return BatteryService.isCharging ? "󱊥" : "󱊢";
        } else {
            return BatteryService.isCharging ? "󱊦" : "󱊣";
        }
    }
    tooltip: "Battery: " + BatteryService.percentage + "%"
    visible: BatteryService.battery !== null
}