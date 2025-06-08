import QtQuick
import content
import src

Window {
    id: root

    color: "#222"
    height: 480
    title: "Hello World"
    visible: true
    width: 640

    Rectangle {
        id: main

        anchors {
            bottom: bottombar.top
            top: parent.top
        }

        AudioBox {
            id: firstSong

            author: "wm"
            songIndex: 0
            title: "test123"

            anchors {
                left: parent.left
                margins: 20
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
        }

        AudioBox {
            id: secondSong

            author: "wm"
            songIndex: 1
            title: "test222"

            anchors {
                left: parent.left
                margins: 20
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
        }

        AudioBox {
            id: thirdSong

            author: "wm"
            songIndex: 2
            title: "test333"

            anchors {
                left: parent.left
                margins: 20
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
        }
    }

    Rectangle {
        id: bottombar

        color: "#333"
        height: 100

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

                height: 50
                source: "images/arrow-left-circle.svg"
                width: 50

                onClicked: PlayerController.switchToPreviousSong()
            }

            ImageButton {
                id: playPauseButton

                height: 50
                source: PlayerController.playing ? "images/pause-circle.svg" : "images/play-circle.svg"
                width: 50

                onClicked: PlayerController.playPause()
            }

            ImageButton {
                id: nextButton

                height: 50
                source: "images/arrow-right-circle.svg"
                width: 50

                onClicked: PlayerController.switchToNextSong()
            }
        }
    }
}
