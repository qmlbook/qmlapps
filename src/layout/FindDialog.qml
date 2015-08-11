import QtQuick 2.4
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4

Dialog {
    id: root
    title: "Find Dialog"
    visible: true

    signal findforward(string text, bool caseSensitive)
    signal finadBackward(string text, bool caseSensitive)

    contentItem: FindDialogForm {
        id: layout
        anchors.fill: parent
        anchors.margins: spacing
        findField.text: 'Find Me'
        find.onClicked: {
            var text = findField.text;
            var caseSensitive = matchCase.checked;
            if(searchBackward.checked) {
                root.searchBackward(text, caseSensitive);
            } else {
                root.findforward(text, caseSensitive);
            }
        }
        close.onClicked: {
            root.close();
        }
    }
}
