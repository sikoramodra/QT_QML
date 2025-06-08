import QtQuick
import src

Item {
    id: root

    property alias author: authorText.text
    property alias imageSource: albumImage.source
    required property int songIndex
    property alias title: titleText.text

    visible: PlayerController.currentSongIndex === root.songIndex

    Image {
        id: albumImage

        height: 100
        source: "images/song-image-default.png"
        width: 100

        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }
    }

    Text {
        id: titleText

        color: "#FFF"
        wrapMode: Text.WordWrap

        font {
            bold: true
            pixelSize: 20
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
            right: parent.right
            topMargin: 5
        }
    }
}
