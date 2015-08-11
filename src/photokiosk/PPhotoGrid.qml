import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.2
import controls 1.0
import utils 1.0
import engine 1.0

Item {
    id: root
    width: 800
    height: 600

    property alias model: view.model

    GridView {
        id: view
        anchors.fill: parent
        cellWidth: root.width/5
        cellHeight: root.height/4
        delegate: Item {
            id: wrapper
            width: view.cellWidth
            height: view.cellHeight
            Rectangle {
                anchors.fill: image
                anchors.margins: -2
                color: '#ffffff'
                opacity: 0.2
            }
            Image {
                id: image
                anchors.fill: parent
                anchors.margins: 16
                source: view.model.photoSource(model.name)
                sourceSize: Qt.size(width, height)
                asynchronous: true
                fillMode: Image.PreserveAspectCrop
            }
        }
    }
}