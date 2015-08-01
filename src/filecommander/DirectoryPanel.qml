import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import org.qmlbook.filecommander 1.0
import "common" 1.0


FocusScope {
    id: root
    width: 400
    height: 600

    signal switchSide()

    property string workingDirectory: FileSystem.location("home")
    property string nameFilter: ''
    property var entries: FileSystem.entryList(workingDirectory, nameFilter)


    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 1
        spacing: 1
        Label {
            Layout.fillWidth: true
            text: root.workingDirectory
        }
        TableView {
            id: view
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: root.entries
            backgroundVisible: true
            focus: true
            onCurrentRowChanged: {
                if(activeFocus) {
                    UI.currentEntry = model[currentRow]
                }
            }
            TableViewColumn {
                role: "icon"
                width: 32
                delegate: ImageCellDelegate {
                    width: 32
                    height: 32
                    icon: modelData.isDir?"icons/folder.svg":""
                }
            }
            TableViewColumn {
                title: "Name"
                role: "name"
                width: 200
                delegate: LabelCellDelegate {
                    text: modelData.name
                }
            }
            TableViewColumn {
                title: "Ext"
                role: "extension"
                width: 40
            }
            TableViewColumn {
                title: "Size"
                role: "size"
                width: 40
                delegate: LabelCellDelegate {
                    text: root.formatSizeUnits(modelData.size)
                }
            }
            TableViewColumn {
                title: "Modified"
                role: "modified"
                delegate: LabelCellDelegate {
                    text: Qt.formatDateTime(modelData.modified, 'dd.MM.yy')
                }
            }
            onActivated: {
                var entry = root.entries[row]
                if(entry.isFile) {
                    if(UI.editorExtensions.indexOf(entry.extension) !== -1) {
                        UI.openViewer(entry)
                    } else {
                        FileSystem.open(entry.path)
                    }
                } else if(entry.isDir) {
                    root.workingDirectory = entry.path
                }
                currentRow = 0
                selection.select(0)
            }
            onActiveFocusChanged: {
                if(activeFocus) {
                    if(currentRow === -1) {
                        currentRow = 0
                    }
                    selection.select(currentRow)
                }
            }
            Keys.onEscapePressed: {
                root.workingDirectory = FileSystem.cdUp(root.workingDirectory)
                currentRow = 0
                selection.select(0)
            }
            Keys.onTabPressed: root.switchSide()
            Keys.onBacktabPressed: root.switchSide()
            selectionMode: SelectionMode.ExtendedSelection

        }
        TextField {
            Layout.fillWidth: true
            placeholderText: "filter"
            text: root.nameFilter
            onTextChanged: {
                root.nameFilter = text
            }
        }
    }

    function selectedEntries() {
        var entries = []
        view.selection.forEach(function(index) {
            entries.push(view.model[index])
        });
        return entries;
    }

    function formatSizeUnits(bytes){
        if      (bytes>=1000000000) {bytes=(bytes/1000000000).toFixed(1)+'GB';}
        else if (bytes>=1000000)    {bytes=(bytes/1000000).toFixed(1)+'MB';}
        else if (bytes>=1000)       {bytes=(bytes/1000).toFixed(1)+'KB';}
        else                        {bytes=bytes+'b';}
        return bytes;
    }
}
