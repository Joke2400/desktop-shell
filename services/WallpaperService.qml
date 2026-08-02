pragma Singleton
import qs.config.settings

import QtQuick
import Quickshell
import Qt.labs.folderlistmodel

Singleton {
    id: root

    property alias folder: folderModel.folder
    property alias model: folderModel

    FolderListModel {
        id: folderModel
        folder: Settings.wallpaperDirPath
        nameFilters: ["*.png", "*.jpg"]
        showDirs: false
        sortField: FolderListModel.Name
    }
}
