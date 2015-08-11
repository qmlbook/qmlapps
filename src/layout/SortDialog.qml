import QtQuick 2.4
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4

Dialog {
    id: root
    title: "Sort"
    width: contentLayout.implicitWidth
    height: contentLayout.implicitHeight
    contentItem: ColumnLayout {
        id: contentLayout
        implicitWidth: childrenRect.width
        implicitHeight: childrenRect.height        
        RowLayout {
            ColumnLayout {
                GroupBox {
                    id: primaryKeyGroup
                    Layout.fillWidth: true
                    title: qsTr("Primary Key")
                    GridLayout {
                        columns: 2
                        Label {
                            text: qsTr("Column")            
                        }
                        ComboBox {
                        }
                        Label {
                            text: qsTr("Order")
                        }
                        ComboBox {
                        }
                    }
                }
                GroupBox {
                    id: secondaryKeyGroup
                    Layout.fillWidth: true
                    visible: false
                    title: qsTr("Secondary Key")
                    GridLayout {
                        columns: 2
                        Label {
                            text: qsTr("Column")            
                        }
                        ComboBox {
                        }
                        Label {
                            text: qsTr("Order")
                        }
                        ComboBox {
                        }
                    }
                }
                GroupBox {
                    id: tertiaryKeyGroup
                    visible: false
                    Layout.fillWidth: true
                    title: qsTr("Tertiary Key")
                    GridLayout {
                        columns: 2
                        Label {
                            text: qsTr("Column")            
                        }
                        ComboBox {
                        }
                        Label {
                            text: qsTr("Order")
                        }
                        ComboBox {
                        }
                    }
                }

            }
            ColumnLayout {
                Button {
                    text: qsTr("Ok")
                    Layout.fillWidth: true
                }
                Button {
                    text: qsTr("Cancel")
                    Layout.fillWidth: true
                }
                Item {
                    Layout.fillHeight: true
                }
                Button {
                    text: qsTr("More")
                    Layout.fillWidth: true
                    onClicked: {
                        console.log('clicked')
                        secondaryKeyGroup.visible = !secondaryKeyGroup.visible
                        tertiaryKeyGroup.visible = !tertiaryKeyGroup.visible
                    }
                }

            }
        }
        Item {
            Layout.fillHeight: true
        }
    }
}
