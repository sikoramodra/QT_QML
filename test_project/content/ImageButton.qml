import QtQuick

Item {
    id: root

    property alias source: image.source

    signal clicked()

    Image {
        id: image

        anchors.fill: parent
        opacity: buttonMouseArea.containsMouse ? 0.8 : 1
    }

    MouseArea {
        id: buttonMouseArea

        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            root.clicked();
        }
    }

}
