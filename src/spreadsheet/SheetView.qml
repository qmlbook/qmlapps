import QtQuick 2.4
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4


Item {
    id: root
    width: 800
    height: 600

    property alias model: view.model
    onModelChanged: {
        print('model')
    }

    Component {
        id: columnDelegate
        TableViewColumn {            
        }
    }

    TableView {
        id: view
        anchors.fill: parent
    }

    function addColumnBefore(index) {
        var col = view.insertColumn(index, columnDelegate)
    }

    function addColumnAfter(index) {
        var col = view.insertColumn(index+1, columnDelegate)
    }
}