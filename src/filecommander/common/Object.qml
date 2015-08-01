import QtQuick 2.4

QtObject {
    id: root
    default property alias children: root.__childrenArray
    property list<QtObject> __childrenArray
}
