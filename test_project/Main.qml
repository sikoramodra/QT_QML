import QtQuick

Window {
    id: root

    width: 640
    height: 480

    title: "Hello World"
    visible: true

    color: "#000"

    Rectangle {
        id: rectangle

        // property bool testProp: true
        // signal testSignal()

        // property real rotationSq: 0.0

        anchors.centerIn: parent

        width: 200
        height: 200

        color: "#fff"

        // rotation: mouseArea.containsPress ? 45 : 0
        // rotation: rectangle.rotationSq
        radius: width / 4

        Behavior on rotation {
            PropertyAnimation {
                duration: 200
            }
        }

        MouseArea {
            id: mouseArea

            anchors.fill: parent

            onClicked: {
                rectangle.rotation += 90;
            }

        }
    }

    Rectangle {
        anchors {
            top: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
            topMargin: 150
        }

        width: 50
        height: 50

        color: "#f00"

        radius: width / 4

        Text {
            id: buttonText

            anchors.centerIn: parent
            text: "✕"

            font.pixelSize: 40
        }

        MouseArea {
            id: closeArea

            anchors.fill: parent

            onClicked: {
                Qt.quit()
            }
        }
    }

    // function rotateSq() {
    //     rectangle.rotationSq++;
    //     if (rectangle.rotationSq <= 360) {
    //         requestAnimationFrame(rotateSq);
    //     } else {
    //         rectangle.rotationSq = 0.0;
    //     }
    // }
}
