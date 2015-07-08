import QtQuick 2.0
import "YoshiScripts.js" as YoshiBehavior

Item {
    id: yoshi
    objectName: "yoshi"
    width: parent.width
    height: parent.height
    x: 300
    y: stage.ground.y - height
    signal moveRightSignal

    property alias idleTimer: idleTimer
    property alias animation: animation

    YoshiAnimation {
        id: animation
        width: parent.width
        height: parent.height
    }

    PlayerEvent {
        id: playerEvent
    }

    Timer {
        id: idleTimer
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
        }
    }

    onXChanged: {
        console.log("send it dammit!")
        yoshi.moveRightSignal();
    }

    MouseArea {
        anchors.fill: parent;
        onClicked: {
            moveRightSignal();
        }
    }
}

