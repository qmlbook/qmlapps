import QtQuick 2.4
import QtQuick.Controls 1.3

MenuBar {
    property ActionRegistry actionRegistry
    Menu {
        title: qsTr("File")
        MenuItem { action: actionRegistry.fileNew }
        MenuItem { action: actionRegistry.fileOpen }
        MenuItem { action: actionRegistry.fileSave }
        MenuItem { action: actionRegistry.fileSaveAs }
        MenuSeparator { }
        MenuSeparator { }
        MenuItem { action: actionRegistry.fileExit }
    }
    Menu {
        title: qsTr("Edit")
        MenuItem { action: actionRegistry.editCut }
        MenuItem { action: actionRegistry.editCopy }
        MenuItem { action: actionRegistry.editPaste }
        MenuItem { action: actionRegistry.editDelete }
        Menu { 
            title: qsTr("Select") 
            MenuItem { action: actionRegistry.editSelectRow }
            MenuItem { action: actionRegistry.editSelectColumn }
            MenuItem { action: actionRegistry.editSelectAll}
        }
        MenuItem { action: actionRegistry.editFind }
        MenuItem { action: actionRegistry.editGotoCell }
    }
    Menu {
        title: qsTr("Tools")
        MenuItem { action: actionRegistry.toolsRecalculate }
        MenuItem { action: actionRegistry.toolsSort }
    }
    Menu {
        title: qsTr("Options")
        MenuItem { action: actionRegistry.optionsShowGrid }
        MenuItem { action: actionRegistry.optionsAutoRecalculate }
    }
    Menu {
        title: qsTr("Help")
        MenuItem { action: actionRegistry.helpAbout }
        MenuItem { action: actionRegistry.helpAboutQt }
    }
}