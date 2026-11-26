import qs.services
import qs.config.style

ControlSlider {
    id: root

    property int gamma: BrightnessService.gamma
    property int temperature: BrightnessService.temperature
    property bool dimmed: BrightnessService.temperature !== 6000

    ratio: root.gamma / 100
    ratioMin: 0.5
    ratioMax: 1
    action: ratio => {
        BrightnessService.setGamma(Math.round(ratio * 100));
    }
    btn: SliderButton {
        text: {
            if (root.gamma < 70) {
                return "󰃞";
            } else if (root.gamma < 85) {
                return "󰃟";
            } else {
                return "󰃠";
            }
        }
        tooltip: root.dimmed ? "Nightlight" : "Bluelight"

        textCol: root.dimmed ? Color.colDarkOrange : Color.textNormal
        textColHover: root.dimmed ? Color.colOrange : Color.textLight

        leftAction: () => {
            if (root.dimmed) {
                BrightnessService.bluelight();
            } else {
                BrightnessService.nightlight();
            }
        }
        middleAction: () => {
            BrightnessService.bluelight();
        }
        rightAction: () => {
            BrightnessService.nightlight();
        }
    }
}