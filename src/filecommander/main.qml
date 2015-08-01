import QtQuick 2.3
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import "common" 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
        }
        Menu {
            title: qsTr("Edit")
        }
        Menu {
            title: qsTr("Help")
        }
    }

    AppContent {
        anchors.fill: parent
        focus: true

    }


    Component.onCompleted: {
        UI.viewAction = viewAction
        UI.editAction = editAction
        UI.copyAction = copyAction
    }

}
