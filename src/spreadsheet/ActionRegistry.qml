import QtQuick 2.4
import QtQuick.Controls 1.3

Item {
    id: root
    property alias fileNew: fileNew
    property alias fileOpen: fileOpen
    property alias fileSave: fileSave
    property alias fileSaveAs: fileSaveAs
    property alias fileExit: fileExit
    property alias editCut: editCut
    property alias editCopy: editCopy
    property alias editPaste: editPaste
    property alias editDelete: editDelete
    property alias editSelectRow: editSelectRow
    property alias editSelectColumn: editSelectColumn
    property alias editSelectAll: editSelectAll
    property alias editFind: editFind
    property alias editGotoCell: editGotoCell
    property alias toolsRecalculate: toolsRecalculate
    property alias toolsSort: toolsSort
    property alias optionsShowGrid: optionsShowGrid
    property alias optionsAutoRecalculate: optionsAutoRecalculate
    property alias helpAbout: helpAbout
    property alias helpAboutQt: helpAboutQt

    signal triggerFileOpen()
    signal triggerFileSave()
    signal triggerFileSaveAs()

    // File Actions
    Action {
        id: fileNew
        text: qsTr("New")
    }
    Action {
        id: fileOpen
        text: qsTr("Open")
        onTriggered: {
            root.triggerFileOpen()
        }
    }
    Action {
        id: fileSave
        text: qsTr("Save")
    }
    Action {
        id: fileSaveAs
        text: qsTr("Save As")
    }
    Action {
        id: fileExit
        text: qsTr("Exit")
        onTriggered: Qt.quit()
    }
    // Edit Actions
    Action {
        id: editCut
        text: qsTr("Cut")
    }
    Action {
        id: editCopy
        text: qsTr("Copy")
    }
    Action {
        id: editPaste
        text: qsTr("Paste")
    }
    Action {
        id: editDelete
        text: qsTr("Delete")
    }
    Action {
        id: editSelectRow
        text: qsTr("Row")
    }
    Action {
        id: editSelectColumn
        text: qsTr("Column")
    }
    Action {
        id: editSelectAll
        text: qsTr("All")
    }
    Action {
        id: editFind
        text: qsTr("Find")
    }
    Action {
        id: editGotoCell
        text: qsTr("Goto Cell")
    }

    // Tools Actions
    Action {
        id: toolsRecalculate
        text: qsTr("Recalculate")        
    }
    Action {
        id: toolsSort
        text: qsTr("Sort ...")        
    }

    // Options Actions
    Action {
        id: optionsShowGrid
        text: qsTr("Show Grid")
    }
    Action {
        id: optionsAutoRecalculate
        text: qsTr("Auto Recalculate")
    }
    // Help Actions
    Action {
        id: helpAbout
        text: qsTr("About")
    }
    Action {
        id: helpAboutQt
        text: qsTr("About Qt")
    }    
}