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

    ListView {
        id: view
        anchors.fill: parent
        spacing: 2
        delegate: Item {
            width: ListView.view.width
            height: 48
            Rectangle {
                anchors.fill: parent
                color: '#ffffff'
                opacity: 0.2
            }            
            Rectangle {
                anchors.fill: parent
                color: 'transparent'
                border.color: '#FFFFFF'
                opacity: 0.1
            }

            RowLayout {
                anchors.fill: parent
                spacing: 9
                Image {
                    Layout.preferredWidth: 48
                    Layout.preferredHeight: 48
                    sourceSize: Qt.size(48, 48)
                    source: view.model.photoSource(model.name)
                    asynchronous: true
                }
                PLabel {
                    Layout.fillWidth: true
                    text: PStyle.toTitleCase(model.name)
                }
            }
        }
    }
}