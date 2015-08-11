import QtQuick 2.4
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4

RowLayout {
    id: layout
    spacing: 12
    implicitWidth: 400
    implicitHeight: 100

    property alias find: find
    property alias close: close
    property alias matchCase: matchCase
    property alias searchBackward: searchBackward
    property alias findField: findField


    ColumnLayout {
        id: leftLayout   
        RowLayout {
            id: topLeftLayout
            Label {
                text: 'Find'
            }

            TextField {
                id: findField
                Layout.fillWidth: true
                Layout.columnSpan: 2
            }
        }
        Item {
            Layout.preferredHeight: 8
        }
        CheckBox {
            id: matchCase
            text: 'Match case'
            Layout.columnSpan: 3
        }

        CheckBox {
            id: searchBackward
            text: 'Search backward'
            Layout.columnSpan: 3
        }    
        Item {
            Layout.fillHeight: true
        }  
    }
    ColumnLayout {
        id: rightLayout
        Button {
            id: find
            text: 'Find'
            enabled: findField.text
            Layout.preferredWidth: 80
        }
        Button {
            id: close
            text: 'Close'
            Layout.preferredWidth: 80
        }      
        Item {
            Layout.fillHeight: true
        }  
    }

}
