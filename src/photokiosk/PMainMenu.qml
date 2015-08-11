import QtQuick 2.4
import QtQml.Models 2.1
import QtQuick.Layouts 1.2
import controls 1.0
import utils 1.0

Item {
    id: root
    width: 240
    height: 600

    signal closeMenu()

    signal openPhotoGrid()
    signal openPhotoList()
    signal openPhotoSingle()
    signal openPhotoSettings()

    Rectangle {
        anchors.fill: parent
        anchors.margins: -1
        color: '#000000'
        opacity: 0.95
    }
    Rectangle {
        anchors.fill: parent
        anchors.margins: -1
        color: 'transparent'
        opacity: 0.2
        border.color: '#ffffff'
    }

    PToolBar {
        id: toolBar
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top        
        RowLayout {
            anchors.fill: parent
            PTool {
                iconSource: PStyle.icon('menu')
                onClicked: root.closeMenu()
            }
        }    
    }
    ListView {
        id: view
        anchors.left: parent.left
        anchors.top: toolBar.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        model: ObjectModel {
            PButton {
                width: ListView.view.width
                text: 'Grid'   
                onClicked: root.openPhotoGrid()             
            }
            PButton {
                width: ListView.view.width
                text: 'List'
                onClicked: root.openPhotoList()
            }
            PButton {
                width: ListView.view.width
                text: 'Single'
                onClicked: root.openPhotoSingle()
            }
            PButton {
                width: ListView.view.width
                text: 'Settings'
                onClicked: root.openPhotoSettings()
            }
        }
    }
}