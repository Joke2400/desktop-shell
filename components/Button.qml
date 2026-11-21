import QtQuick

ButtonBase {
   id: root

   implicitWidth: Math.max(btnText.implicitWidth + root.padding * 2, root.minBtnSize + root.padding * 2)
   implicitHeight: Math.max(btnText.implicitHeight + root.padding * 2, root.minBtnSize + root.padding * 2)

    DisplayText {
        id: btnText
        anchors.centerIn: parent

        text: root.text
        col: root.textCol
        colHover: root.textColHover
        hovered: root.hovered
        size: root.textSize
    }
}
