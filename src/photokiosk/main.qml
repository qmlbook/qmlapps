import QtQuick 2.4
import QtQuick.Window 2.2
import utils 1.0
import controls 1.0
import engine 1.0

Window {
    id: root
    width: 800
    height: 600
    title: 'Photo Kiosk'
    color: '#000'

    Item {
        id: centralContent
        anchors.fill: parent    
        PContentStack {
            id: content
            anchors.fill: parent
            initialItem: PPhotoView {
                id: photoView
                model: photoModel                
            }
            // initialItem: PPhotoGrid {
            //     id: photoView
            //     model: photoModel                
            // }
        }
        PMainToolBar {
            id: toolBar
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            onOpenMenu: {
                mainMenu.open()
            }
        }    
        PMainStatusBar {
            id: statusBar
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            photoName: PCore.currentPhoto
        }    
    }

    PMainMenu {        
        id: mainMenu
        x: -width-2
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        Behavior on x {
            NumberAnimation {}
        }
        function open() {
            x = 0
        }        
        function close() {
            x = -width-2
        }
        onCloseMenu: {
            close()
        }

        onOpenPhotoGrid: {
            content.push({item: Qt.resolvedUrl("PPhotoGrid.qml"), replace:true, properties: { model: photoModel }});
            close();
        }
        onOpenPhotoSingle: {
            content.push({item: Qt.resolvedUrl("PPhotoView.qml"), replace:true, properties: { model: photoModel }});
            close();            
        }
        onOpenPhotoList: {
            content.push({item: Qt.resolvedUrl("PPhotoList.qml"), replace:true, properties: { model: photoModel }});
            close();            
        }
    }

    PPhotoModel {
        id: photoModel
    }

}