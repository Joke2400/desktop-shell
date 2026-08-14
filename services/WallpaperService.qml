pragma Singleton
import qs.config.style
import qs.config.settings

import QtQuick
import Quickshell
import Qt.labs.folderlistmodel

Singleton {
    id: root

    property alias model: folderModel

    readonly property real preloadImageHeight: Constant.carouselHeight
    readonly property real preloadImageWidth: Math.min(preloadImageHeight, Settings.selectedScreen.height / Settings.carouselItemCount)

    FolderListModel {
        id: folderModel
        folder: Settings.wallpaperDirPath
        nameFilters: ["*.png", "*.jpg"]
        showDirs: false
        sortField: FolderListModel.Name
    }

    Instantiator {
        model: folderModel
        asynchronous: true
        delegate: Image {
            id: image
            required property string fileUrl

            cache: true
            asynchronous: true
            source: fileUrl
            fillMode: Image.PreserveAspectCrop
            visible: false
            onStatusChanged: if (status === Image.Ready)
                console.log("preloaded:", fileUrl, Date.now(), "w/h", image.width, image.height)
        }
    }
}
