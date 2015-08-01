import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import org.qmlbook.filecommander 1.0

FocusScope {
    id: root
    width: 800
    height: 600

    property var entry
    onEntryChanged: print('entry: ' + entry)


    Action {
        id: exitAction
        shortcut: 'F10'
        onTriggered: root.Stack.view.pop()
    }
    states: [
        State {
            name: "viewer"
            PropertyChanges { target: editor; readOnly: true }
        },
        State {
            name: "editor"
            PropertyChanges { target: editor; readOnly: false }
        }
    ]

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 2
        TextArea {
            id: editor
            Layout.fillWidth: true
            Layout.fillHeight: true
            focus: true
            text: root.entry?FileSystem.read(root.entry.path):''
        }
        ToolBar {
            Layout.fillWidth: true
            RowLayout {
                anchors.fill: parent
                ToolButton {
                    text: "F2 Write"
                }
                ToolButton {
                    text: "F3 Mark"
                }
                ToolButton {
                    text: "F4 Replace"
                }
                ToolButton {
                    text: "F5 Copy"
                }
                ToolButton {
                    text: "F6 Move"
                }
                ToolButton {
                    text: "F7 Search"
                }
                ToolButton {
                    text: "F8 Delete"
                    onClicked: {}
                }
                Item {
                    Layout.fillWidth: true
                }
                ToolButton {
                    action: exitAction
                }
            }
        }
    }
}

