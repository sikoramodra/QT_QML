import QtQuick
import content
import src

Window {
    id: root

    width: 640
    height: 480
    title: "Hello World"
    visible: true
    color: "#222"

    Rectangle {
        id: main

        anchors {
            top: parent.top
            bottom: bottombar.top
        }

        AudioBox {
            id: firstSong

            songIndex: 0
            title: "test123"
            author: "wm"

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 20
            }

        }

        AudioBox {
            id: secondSong

            songIndex: 1
            title: "test222"
            author: "wm"

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 20
            }

        }

        AudioBox {
            id: thirdSong

            songIndex: 2
            title: "test333"
            author: "wm"

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 20
            }

        }

    }

    Rectangle {
        id: bottombar

        height: 100
        color: "#333"

        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        Row {
            anchors.centerIn: parent
            spacing: 20

            ImageButton {
                id: previousButton

                width: 50
                height: 50
                source: "images/arrow-left-circle.svg"
                onClicked: PlayerController.switchToPreviousSong()
            }

            ImageButton {
                id: playPauseButton

                width: 50
                height: 50
                source: PlayerController.playing ? "images/pause-circle.svg" : "images/play-circle.svg"
                onClicked: PlayerController.playPause()
            }

            ImageButton {
                id: nextButton

                width: 50
                height: 50
                source: "images/arrow-right-circle.svg"
                onClicked: PlayerController.switchToNextSong()
            }

        }

    }

}
