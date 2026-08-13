import qs.components
import QtQuick

ButtonBase {
    id: root

    required property int index
    required property string fileUrl

    height: PathView.view.height
    width: Math.min(height, PathView.view.width / PathView.view.pathItemCount)
    clip: true

    Image {
        id: image
        anchors.fill: parent

        source: root.fileUrl
        sourceSize.width: root.width
        sourceSize.height: root.height
        fillMode: Image.PreserveAspectCrop
    }

    onLeftClicked: {
        console.log("left clicked", root.index);
    }
}
