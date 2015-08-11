import QtQuick 2.4
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4

Dialog {
    title: "Find Dialog"
    visible: true

    contentItem: GridLayout {
        id: layout
        implicitWidth: 400
        implicitHeight: 120
        anchors.fill: parent
        anchors.margins: 5
        columns: 4

        Label {
            text: 'Find'
        }

        TextField {
            Layout.fillWidth: true
            Layout.columnSpan: 2
        }

        Button {
            text: 'Find'
            Layout.fillWidth: true
        }


        CheckBox {
            text: 'Match case'
            Layout.columnSpan: 3
        }

        Button {
            text: 'Close'
            Layout.fillWidth: true
        }

        CheckBox {
            text: 'Search backward'
            Layout.columnSpan: 3
        }

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.columnSpan: 4
        }


    }
}
