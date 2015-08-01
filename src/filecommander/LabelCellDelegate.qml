import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

Item {
    id: root
    property alias text: label.text

    Label {
        id: label
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 2
        anchors.rightMargin: 2
        color: styleData.textColor
        elide: styleData.elideMode
        horizontalAlignment: styleData.textAlignment
    }
}
