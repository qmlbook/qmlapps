import QtQuick 2.4
import utils 1.0
Item {
    id: root
    width: 48; height: width
    
    property alias iconSource: image.source
    signal clicked()

    Rectangle {
        anchors.fill: parent
        color: '#FFFFFF'
        opacity: area.pressed?0.1:0.0
        Behavior on opacity {
            NumberAnimation {}
        }
    }
    Image {
        id: image
        anchors.centerIn: parent
    }
    MouseArea {
        id: area
        anchors.fill: parent
        onClicked: root.clicked()
    }
    PTracer {}
}