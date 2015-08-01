import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import org.qmlbook.filecommander 1.0

Item {
    id: root
    property alias icon: image.source

    Image {
        id: image
        anchors.fill: parent
        anchors.leftMargin: 2
        anchors.rightMargin: 2
        fillMode: Image.PreserveAspectFit
    }
}
