import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

Item {
    width: 800
    height: 600

    SplitView {
        anchors.fill: parent
        DirectoryPanel {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        DirectoryPanel {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }

}
