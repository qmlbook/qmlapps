import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.2
import controls 1.0
import utils 1.0
import engine 1.0

Item {
    id: root
    width: 800
    height: 600

    property var model
    onModelChanged: {
        updatePhoto();
    }
    property int currentIndex: 0
    onCurrentIndexChanged: {
        updatePhoto();
    }

    property string currentPhoto

    function next() {
        if(currentIndex +1 < model.count) {
            currentIndex++
        }        
    }

    function previous() {
        if(currentIndex>0) {
            currentIndex--
        }
    }


    Component {
        id: stackDelegate
        Image {
            fillMode: Image.PreserveAspectCrop
            // asynchronous: true
            // Component.onDestruction: {
            //     print('destroy: ' + source)
            // }
        }
    }

    StackView {
        id: stack
        anchors.fill: parent
        delegate: StackViewDelegate {
            function transitionFinished(properties) {
            properties.exitItem.opacity = 1
            }

            pushTransition: StackViewTransition {
                PropertyAnimation {
                    target: enterItem
                    property: "opacity"
                    from: 0
                    to: 1
                }
                PropertyAnimation {
                    target: exitItem
                    property: "opacity"
                    from: 1
                    to: 0
                }
            }
        }
    }

    PTool {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        iconSource: PStyle.icon('chevron-left')
        onClicked: root.previous();
    }

    PTool {
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        iconSource: PStyle.icon('chevron-right')
        onClicked: root.next();
    }


    function updatePhoto() {
        currentPhoto = model.get(currentIndex).name;
        var source = model.photoSource(currentPhoto);
        stack.push({ item: stackDelegate, replace: true, properties: { source: source } });
        PCore.currentPhoto = currentPhoto
    }


}