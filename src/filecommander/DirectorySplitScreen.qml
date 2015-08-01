import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import "common" 1.0
import org.qmlbook.filecommander 1.0

FocusScope {
    id: root
    width: 800
    height: 600

    property DirectoryPanel currentPanel

    Action {
        id: viewAction
        text: "F3 View"
        shortcut: "F3"
        onTriggered: UI.openViewer(UI.currentEntry)
    }

    Action {
        id: editAction
        text: "F4 Edit"
        shortcut: "F4"
        onTriggered: UI.openEditor(UI.currentEntry)
    }
    Action {
        id: copyAction
        text: "F5 Copy"
        shortcut: "F5"
        onTriggered: print('copy')
    }

    states: [
        State {
            name: 'left'
            PropertyChanges { target: left; focus: true }
            PropertyChanges { target: root; currentPanel: left }
        },
        State {
            name: 'right'
            PropertyChanges { target: right; focus: true }
            PropertyChanges { target: root; currentPanel: right }
        }
    ]


    ColumnLayout {
        anchors.fill: parent


        SplitView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            DirectoryPanel {
                id: left
                Layout.fillWidth: true
                Layout.fillHeight: true
                focus: true
                onSwitchSide: root.state = 'right'
            }
            DirectoryPanel {
                id: right
                onSwitchSide: root.state = 'left'
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }

        ToolBar {
            Layout.fillWidth: true
            RowLayout {
                anchors.fill: parent
                ToolButton {
                    action: viewAction
                }
                ToolButton {
                    action: editAction
                }
                ToolButton {
                    action: copyAction
                }
                Item {
                    Layout.fillWidth: true
                }
            }
        }
    }


}
