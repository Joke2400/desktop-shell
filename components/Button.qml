import qs.config.style

import QtQuick
import QtQuick.Layouts

ButtonBase {
    id: root

    property string buttonText: ""
    property string buttonIcon: ""
    property string tooltipText: ""

    property color textColor: Color.textNormal
    property color textColorHover: textColor
    property color iconColor: Color.textNormal
    property color iconColorHover: iconColor

    property int textSize: Constant.fontSizeMedium
    property int iconSize: Constant.iconSizeMedium
    property int innerSpacing: 0
    property int buttonPadding: Constant.paddingSmall
    property int hoverSizeIncrease: 2

    function getButtonMinWidth(): int {
        if (root.buttonText.length > 0 && root.buttonIcon.length > 0) {
            return iconSize + hoverSizeIncrease + innerSpacing + textMetricsHovered.advanceWidth(root.buttonText) + buttonPadding * 2;
        } else if (root.buttonText.length > 0) {
            return textMetricsHovered.advanceWidth(root.buttonText) + buttonPadding * 2;
        } else {
            return iconSize + hoverSizeIncrease * 2 + buttonPadding * 2;
        }
    }

    function getButtonMinHeight(): int {
        if (root.buttonText.length > 0 && root.buttonIcon.length > 0) {
            return Math.max(iconSize, textSize) + hoverSizeIncrease * 2 + buttonPadding * 2;
        } else if (root.buttonText.length > 0) {
            return textSize + hoverSizeIncrease * 2 + buttonPadding * 2;
        } else {
            return iconSize + hoverSizeIncrease * 2 + buttonPadding * 2;
        }
    }

    implicitWidth: getButtonMinWidth()
    implicitHeight: getButtonMinHeight()

    onHoveredChanged: () => {
        if (hovered) {
            color = backgroundColorHover;
            border.color = borderColorHover;

            iconElement.font.pixelSize = root.iconSize + hoverSizeIncrease;
            textElement.font.pixelSize = root.textSize + hoverSizeIncrease;
        } else {
            color = backgroundColor;
            border.color = borderColor;

            iconElement.font.pixelSize = root.iconSize;
            textElement.font.pixelSize = root.textSize;
        }
    }

    FontMetrics {
        id: textMetricsHovered
        font.family: Theme.fontFamily
        font.pixelSize: root.textSize + root.hoverSizeIncrease
        font.bold: true
    }

    RowLayout {
        id: rowLayout
        spacing: root.innerSpacing
        anchors.centerIn: parent

        width: iconElement.implicitWidth + textElement.implicitWidth + root.innerSpacing
        height: iconElement.implicitHeight + textElement.implicitHeight

        Text {
            id: iconElement
            visible: root.buttonIcon.length > 0
            Layout.alignment: Qt.AlignBaseline | Qt.AlignHCenter
            font {
                family: Theme.fontFamily
                pixelSize: root.iconSize
                bold: true
            }
            color: root.hovered ? root.iconColorHover : root.iconColor
            text: root.buttonIcon
        }

        Text {
            id: textElement
            visible: root.buttonText.length > 0
            Layout.alignment: Qt.AlignBaseline | Qt.AlignHCenter
            font {
                family: Theme.fontFamily
                pixelSize: root.textSize
                bold: true
            }
            color: root.hovered ? root.textColorHover : root.textColor
            text: root.buttonText
        }
    }
}
