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
            moveRight();
            if (event.isAutoRepeat) {
                return;
            }
            yoshi.animation.main.jumpTo("walking");
            yoshi.animation.main.goalSprite = "walking";
            break;
        case Qt.Key_A:
        case Qt.Key_Left:
            yoshi.animation.state = "LEFT";
            moveLeft();
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

    function moveRight() {
        // move yoshi up to 75 % of the screen
        if (yoshi.x + 5 < 640 * 0.75 - yoshi.width / 2) {
            yoshi.x += 5;
        }

        // move the screen  if it can be moved. Otherwise allow yoshi to go all the way to the end
        if (yoshi.parent.stage.stage.x - 10 >= -(yoshi.parent.stage.stage.width - 640)) {
            yoshi.parent.stage.stage.x -= 10;
            yoshi.parent.stage.ground.x -= 10;
        } else if (yoshi.x + 5 < 640 - yoshi.width / 2) {
            yoshi.x += 5;
        }
    }

    function moveLeft() {
        // move yoshi up to 25 % of the screen
        if (yoshi.x - 5 > 640 * 0.25 - yoshi.width / 2) {
            yoshi.x -= 5;
        }

        // move the screen  if it can be moved. Otherwise allow yoshi to go all the way to the end
        if (yoshi.parent.stage.stage.x + 10 <= 0) {
            yoshi.parent.stage.stage.x += 10;
            yoshi.parent.stage.ground.x += 10;
        } else if (yoshi.x - 5 > 0) {
            yoshi.x -= 5;
        }
    }

    // Not used
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
        }
    }
}

