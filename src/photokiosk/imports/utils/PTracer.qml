import QtQuick 2.4
import utils 1.0
Item {
    id: root
    anchors.fill: parent
    visible: PStyle.trace
    property var colors: [ '#D0021B', '#F5A623','#F8E71C','#8B572A',
        '#7ED321', '#417505', '#BD10E0', '#9013FE',
        '#4A90E2', '#50E3C2', '#B8E986' 
    ]
    property color color: colors[Math.floor(Math.random() * colors.length)]

    Rectangle {
        anchors.fill: parent
        color: root.color
        opacity: 0.2
    }
    Rectangle {
        anchors.fill: parent
        color: 'transparent'
        border.color: root.color
    }
    Text {
        anchors.centerIn: parent
        color: '#ffffff'
        text: String(root.parent)
        opacity: 0.5
    }
}