import QtQuick 2.3
import QtQuick.Controls 1.2

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

    }

}
