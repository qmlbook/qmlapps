import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3

Window {
    width: 800
    height: 600
    title: 'Hello World'
    visible: true

    Button {
        anchors.centerIn: parent
        text: 'Click to Exit'
        onClicked: Qt.quit()
    }
}