import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import org.qmlbook.filecommander 1.0

Item {
    width: 400
    height: 600

    FileSystem {
        id: fs
    }


    TableView {
        id: view
        anchors.fill: parent
        model: fs.entryInfoList()
        TableViewColumn {
            title: "Name"
            role: "name"
            width: 200
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
        }
        TableViewColumn {
            title: "Modified"
            role: "modified"
            width: 80
        }
    }
}
