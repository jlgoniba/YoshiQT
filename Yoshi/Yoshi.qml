import QtQuick 2.0
import "YoshiScripts.js" as YoshiBehavior
import com.luis.yoshi 1.0

YoshiItem {
    id: yoshi
    objectName: "yoshi"
    width: parent.width
    height: parent.height
    x: 300
    y: stage.ground.y - height

    property alias idleTimer: idleTimer
    property alias animation: animation

    Connections {
        target: yoshi
        onMoveRight: gameLoop.onMoveRight(parent)
        onMoveLeft: gameLoop.onMoveLeft(parent)
    }

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
    }
}

