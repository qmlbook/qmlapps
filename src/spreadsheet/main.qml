import QtQuick 2.4
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2

ApplicationWindow {
    id: root
    width: 800
    height: 600
    menuBar: AppMenuBar {
        actionRegistry: ActionRegistry {
            onTriggerFileOpen: {
                openFileDialog.open()
            }

        }
    }

    toolBar:ToolBar {
        RowLayout {
            anchors.fill: parent
            ToolButton { text: 'ARB' }
            ToolButton { text: 'ARA' }
            ToolButton { text: 'ACB' ; onClicked: sheet.addColumnBefore(0) }
            ToolButton { text: 'ACA' ; onClicked: sheet.addColumnAfter(0) }
            ToolButton { text: 'RRB' }
            ToolButton { text: 'RRA' }
            ToolButton { text: 'RCB' }
            ToolButton { text: 'RCA' }
            Item {
                Layout.fillWidth: true
            }
        }
    }

    SheetView {
        id: sheet
        anchors.fill: parent        
    }

    FileDialog {
        id: openFileDialog
        title: "Open File"
        // folder: shortcuts.home
    }

    FileDialog {
        id: saveFileAsDialog
        title: "Save File As"
    }


}