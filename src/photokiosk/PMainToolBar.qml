import QtQuick 2.4
import QtQuick.Layouts 1.2
import utils 1.0
import controls 1.0

PToolBar {
    id: root
    objectName: 'PToolBar'
    width: 800
    height: 48

    signal openMenu()

    RowLayout {
        anchors.fill: parent
        PTool {
            iconSource: PStyle.icon('menu')
            onClicked: root.openMenu()
        }
    }    
    PTracer {}    
}    
