import QtQuick
import content

Window {
    id: root

    width: 640
    height: 480
    title: "Hello World"
    visible: true
    color: "#9CE"

    Rectangle {
        id: topbar

        height: 50

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }

        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#666"
            }

            GradientStop {
                position: 1
                color: "transparent"
            }

        }

    }

    Rectangle {
        id: main

        anchors {
            top: topbar.bottom
            bottom: bottombar.top
        }

        AudioBox {
            id: firstSong

            songIndex: 0
            title: "test123"
            author: "wm"
            imageColor: "#F00"

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
            imageColor: "#00F"

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
            imageColor: "#0F0"

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

        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        Row {
            anchors.centerIn: parent
            spacing: 20

            TextButton {
                id: previousButton

                width: 50
                height: 50
                text: "←"
                onClicked: playerController.switchToPreviousSong()
            }

            TextButton {
                id: playPauseButton

                width: 50
                height: 50
                text: playerController.playing ? "⏸" : "⏵"
                onClicked: playerController.playPause()
            }

            TextButton {
                id: nextButton

                width: 50
                height: 50
                text: "→"
                onClicked: playerController.switchToNextSong()
            }

        }

        gradient: Gradient {
            GradientStop {
                position: 0
                color: "transparent"
            }

            GradientStop {
                position: 1
                color: "#666"
            }

        }

    }

    QtObject {
        id: playerController

        property int currentSongIndex: 0
        property int songCount: 3
        property bool playing: false

        function playPause() {
            playing = !playing;
        }

        function switchToPreviousSong() {
            if (currentSongIndex > 0)
                currentSongIndex--;
            else
                currentSongIndex = songCount - 1;
        }

        function switchToNextSong() {
            if (currentSongIndex + 1 >= songCount)
                currentSongIndex = 0;
            else
                currentSongIndex++;
        }

    }

}
