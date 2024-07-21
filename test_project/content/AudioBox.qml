import QtQuick
import src

Item {
    id: root

    required property int songIndex
    property alias title: titleText.text
    property alias author: authorText.text
    property alias imageSource: albumImage.source

    visible: PlayerController.currentSongIndex === root.songIndex

    Image {
        id: albumImage

        width: 100
        height: 100
        source: "images/song-image-default.png"

        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
        }

    }

    Text {
        id: titleText

        color: "#FFF"
        wrapMode: Text.WordWrap

        font {
            pixelSize: 20
            bold: true
        }

        anchors {
            bottom: parent.verticalCenter
            left: albumImage.right
            margins: 20
            right: parent.right
        }

    }

    Text {
        id: authorText

        color: "#999"
        wrapMode: Text.WordWrap

        font {
            pixelSize: 16
        }

        anchors {
            bottom: parent.verticalCenter
            left: titleText.left
            topMargin: 5
            right: parent.right
        }

    }

}
