import QtQuick 2.0
import "YoshiScripts.js" as YoshiBehavior

Item {
    focus: true
    anchors.fill: parent

    Keys.onPressed: {
        switch(event.key) {
        case Qt.Key_D:
        case Qt.Key_Right:
            yoshi.animation.state = "RIGHT";
            yoshi.moveRight();
            if (event.isAutoRepeat) {
                return;
            }
            yoshi.animation.main.jumpTo("walking");
            yoshi.animation.main.goalSprite = "walking";
            break;
        case Qt.Key_A:
        case Qt.Key_Left:
            yoshi.animation.state = "LEFT";
            yoshi.moveLeft();
            if (event.isAutoRepeat) {
                return;
            }
            yoshi.animation.main.jumpTo("walking");
            yoshi.animation.main.goalSprite = "walking";
            break;
        case Qt.Key_Space:
            yoshi.animation.jumping.start();
            break;
        }

        event.accepted = true;
    }

    Keys.onReleased: {
        if (event.isAutoRepeat)
            return;

        switch (event.key) {
        case Qt.Key_D:
        case Qt.Key_Right:
        case Qt.Key_A:
        case Qt.Key_Left:
            yoshi.animation.main.jumpTo("idle");
            yoshi.animation.main.goalSprite = ""
            break;
        }
        event.accepted = true;
    }

    function switchDirection() {

    }

    // Not used
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
        }
    }
}

