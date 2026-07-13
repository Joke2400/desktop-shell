import qs.services

import QtQuick

QtObject {
    id: root

    required property Item target
    property bool active: false
    property string text: ""
    property int delay: 200

    function show() {
        TooltipService.visible = true;
        TooltipService.targetX = target.mapToGlobal(0, 0).x;
        TooltipService.targetY = target.mapToGlobal(0, 0).y;
        TooltipService.targetWidth = target.width;
        TooltipService.text = text;
    }

    function hide() {
        TooltipService.visible = false;
    }

    onActiveChanged: {
        if (active) {
            delayTimer.start();
        } else {
            delayTimer.stop();
            hide();
        }
    }

    property Timer delayTimer: Timer {
        interval: root.delay
        onTriggered: root.show()
    }

    property Connections connections: Connections {
        target: root.target
        function onWidthChanged() {
            if (TooltipService.visible && TooltipService.text === root.text)
                Qt.callLater(root.show);
        }
    }
}
