import qs.config.style

import QtQuick
import QtQuick.Layouts

ButtonBase {
    id: root

    required property string tooltip

    // Note: you don´t actually need to provide both, the required properties are for explicitness
    required property string btnIcon
    required property string btnText

    property int iconSize: Constant.iconSizeSmall
    property int textSize: Constant.textSizeMedium

    property color iconCol: Color.textNormal
    property color textCol: Color.textNormal
    property color iconColHover: Color.textLight
    property color textColHover: Color.textLight

    property int spacing: 0 // default is 0 so calc functions still work when either the icon or text are omitted
    property int padding: Constant.paddingSmall
    property int hoverIncreaseAmount: 2
    property bool increaseSizeOnHover: true
    property bool alignTextToBaseline: true

    function calcReservedButtonMinWidth(): int {
        let hasIcon = root.btnIcon.length > 0;
        let hasText = root.btnText.length > 0;

        // advanceWidth() is required to account for the width of the text, since fonts don't necessarily scale linearly
        let minBtnSize = 0;
        if (hasIcon && hasText) {
            minBtnSize += hoveredFontMetrics.advanceWidth(root.btnText) + (root.iconSize + root.hoverIncreaseAmount) + root.spacing;
        } else if (hasText) {
            minBtnSize += hoveredFontMetrics.advanceWidth(root.btnText); // hoverIncreaseAmount is already applied via FontMetrics
        } else {
            minBtnSize += root.iconSize + root.hoverIncreaseAmount;
        }
        return minBtnSize;
    }

    function calcReservedButtonMinHeight(): int {
        let hasIcon = root.btnIcon.length > 0;
        let hasText = root.btnText.length > 0;

        let minBtnSize = 0;
        if (hasIcon && hasText) {
            minBtnSize += (Math.max(root.iconSize, root.textSize) + root.hoverIncreaseAmount);
        } else if (hasText) {
            minBtnSize += root.textSize + root.hoverIncreaseAmount;
        } else {
            minBtnSize += root.iconSize + root.hoverIncreaseAmount;
        }
        return minBtnSize;
    }

    implicitWidth: calcReservedButtonMinWidth() + root.padding * 2
    implicitHeight: calcReservedButtonMinHeight() + root.padding * 2

    color: hovered ? bgColHover : bgCol
    border.color: hovered ? brColHover : brCol

    FontMetrics {
        id: hoveredFontMetrics
        font.family: Theme.fontFamily
        font.pixelSize: root.textSize + root.hoverIncreaseAmount
        font.bold: true
    }

    RowLayout {
        id: rowLayout
        spacing: root.spacing
        anchors.centerIn: parent
        width: iconElement.implicitWidth + textElement.implicitWidth + root.spacing
        height: iconElement.implicitHeight + textElement.implicitHeight

        TextCustom {
            id: iconElement

            txt: root.btnIcon
            col: root.iconCol
            colHover: root.iconColHover

            hovered: root.hovered
            visible: root.btnIcon.length > 0

            size: root.hovered ? (root.increaseSizeOnHover ? root.iconSize + root.hoverIncreaseAmount : root.iconSize) : root.iconSize
            Layout.alignment: root.alignTextToBaseline ? Qt.AlignBaseline | Qt.AlignHCenter : Qt.AlignVCenter | Qt.AlignHCenter
        }

        TextCustom {
            id: textElement

            txt: root.btnText
            col: root.textCol
            colHover: root.textColHover

            hovered: root.hovered
            visible: root.btnText.length > 0

            size: root.hovered ? (root.increaseSizeOnHover ? root.textSize + root.hoverIncreaseAmount : root.textSize) : root.textSize
            Layout.alignment: root.alignTextToBaseline ? Qt.AlignBaseline | Qt.AlignHCenter : Qt.AlignVCenter | Qt.AlignHCenter
        }
    }
}
