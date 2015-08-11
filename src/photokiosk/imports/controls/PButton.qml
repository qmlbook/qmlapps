import QtQuick 2.4
import controls 1.0
import utils 1.0

Item {
    id: root
    width: 128
    height: 48

    signal clicked()

    property alias text: label.text

    Rectangle {
        anchors.fill: parent
        color: '#FFFFFF'
        opacity: area.pressed?0.2:0.1
        Behavior on opacity {
            NumberAnimation {}
        }
    }

    Rectangle {
        anchors.fill: parent
        color: 'transparent'
        border.color: '#FFFFFF'
        opacity: 0.1
    }

    PLabel {
        id: label
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Text.AlignHCenter
    }
    MouseArea {
        id: area
        anchors.fill: parent
        onClicked: root.clicked()
    }
    PTracer {}    
}