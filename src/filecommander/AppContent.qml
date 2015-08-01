import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import "common" 1.0
import org.qmlbook.filecommander 1.0

FocusScope {
    id: root
    width: 800
    height: 600
    focus: true

    Component {
        id: splitScreenComponent
        DirectorySplitScreen {
            id: splitScreen
        }
    }

    Connections {
        target: UI
        onOpenViewer: {
            stackView.push({"item": editorScreenComponent, "properties":{entry: entry, state: "viewer"}})
        }
        onOpenEditor: {
            stackView.push({"item": editorScreenComponent, "properties":{entry: entry, state: "editor"}})
        }
    }

    Component {
        id: editorScreenComponent
        EditorPanel {
            id: editorPanel
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        focus: true
        initialItem:  ({item: splitScreenComponent, properties: {focus : true}})
    }

}
