pragma Singleton
import QtQuick 2.4
import QtQuick.Controls 1.3

Object {
    property Action viewAction
    property Action editAction
    property Action copyAction
    property var currentEntry
    property var editorExtensions: ['txt','py','md','rst', 'js']
    signal openViewer(var entry)
    signal openEditor(var entry)
}

