import QtQuick 2.4
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4

Dialog {
    id: root
    title: "Goto Cell"

    standardButtons: StandardButton.Ok | StandardButton.Cancel

    RowLayout {
        width: parent.width // required as width is not set correctly
        implicitWidth: 200
        implicitHeight: 100
        Label { 
            text: qsTr('Cell Location')
        }
        TextField {
            Layout.fillWidth: true      
            validator: RegExpValidator {
                regExp: /[A-Za-z][1-9][0-9]{0,2}/
            }   
        }
    }

}
