import qs.components
import qs.services
import qs.config.style

import QtQuick

ButtonBase {
    id: root

    required property int index
    required property string monitorOutStr
    required property string fileUrl

    height: PathView.view.height
    width: Math.min(height, PathView.view.width / PathView.view.pathItemCount)
    clip: true

    border.width: Constant.borderMedium
    border.color: Color.baseDark

    Image {
        id: image
        height: parent.height - Constant.borderMedium * 2
        width: parent.width - Constant.borderMedium * 2
        anchors.centerIn: parent
        opacity: 0.9

        asynchronous: true
        source: root.fileUrl
        fillMode: Image.PreserveAspectCrop

        //onStatusChanged: if (status === Image.Ready) {
        //    console.log("Displayed image:", fileUrl, Date.now(), "w/h", image.width, image.height);
        //}
    }

    // Component.onCompleted: console.log("delegate created:", root.fileUrl, Date.now())

    onLeftClicked: {
        WallpaperService.setWallpaper(root.monitorOutStr, root.fileUrl);
    }
}
