import QtQuick 2.4
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4

Window {
    id: root
    title: "Goto Cell Launcher"
    visible: true
    width: 800
    height: 600

    GotoCellDialog {
        id: dialog
    }


    Button {
        anchors.centerIn: parent
        text: "Launch Dialog"
        onClicked: dialog.open()
    }
}
