import QtQuick 2.4
import QtQuick.Layouts 1.2
import utils 1.0
import controls 1.0

PToolBar {
    id: root
    objectName: 'PStatusBar'    
    width: 800
    height: 48
    PTracer {}

    property string photoName

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        PLabel {
            id: photoLabel
            font.pixelSize: PStyle.fontSizeXS
            text: PStyle.toTitleCase(root.photoName)
        }
    }

}    
