import QtQuick

// import QtQuick.Controls

Window {
    id: root

    color: "#222"
    height: 480
    title: "Hello World"
    visible: true
    width: 640

    Rectangle {
        color: "#FFF"
        height: 50
        width: 50

        anchors {
            left: parent.left
            top: parent.top
        }
    }
}
