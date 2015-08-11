pragma Singleton

import QtQuick 2.4

QtObject {
    property bool trace: false
    readonly property int fontSizeXS: 14
    readonly property int fontSizeS: 18
    readonly property int fontSizeM: 24
    readonly property int fontSizeL: 28
    readonly property int fontSizeXL: 36
    function icon(name) {
        return Qt.resolvedUrl('../../icons/' + name + '.svg')
    }

    function toTitleCase(name) {
        return name.replace(/_/g, ' ')
    }

}