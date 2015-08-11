import QtQuick 2.4

Item {
    id: root
    width: 200
    height: 200
    property alias text: label.text

    Rectangle {
        anchors.fill: parent
        color: '#FFFFFF'
        opacity: 0.2
    }
    Rectangle {
        anchors.fill: parent
        color: 'transparent'
        opacity: 0.1
        border.color: '#ffffff'
    }

    Text {
        id: label
        anchors.centerIn: parent                
        color: '#FFFFFF'
    }
}