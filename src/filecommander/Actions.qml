import QtQuick 2.4
import QtQuick.Controls 1.3
import "common" 1.0

Object {
    property Action f10: f10

    Action {
        id: f10
        text: "F10 Exit"
        shortcut: 'F10'
        property var callback
        onTriggered: if(callback) { callback() }
    }
}

