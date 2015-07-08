import QtQuick 2.0
import "YoshiScripts.js" as YoshiBehavior

Item {
    id: container
    width: parent.width
    height: parent.height
    property alias jumping: jumping
    property variant main: normal
    state: "RIGHT"

    SpriteSequence {
        id: normal
        visible: true
        width: parent.width
        height: parent.height
        anchors {
            bottom: parent.bottom
            left: parent.left
        }
        interpolate: false
        goalSprite: ""

        Sprite {
            name: "idle"
            source: "Artwork/yoshi - idle.png"
            frameCount: 10
            frameHeight: 40
            frameWidth: 30
            frameDuration: 400
            to: { "idle": 1, "waiting": 0.1, "walking": 0, "jumping": 0, "falling": 0}
        }

        Sprite {
            name: "waiting"
            source: "Artwork/yoshi - waiting.png"
            frameCount: 10
            frameHeight: 40
            frameWidth: 30
            frameDuration: 150
            to: { "idle": 1, "waiting": 0, "walking": 0, "jumping": 0, "falling": 0}
        }

        Sprite {
            id: walkingSprite
            name: "walking"
            source: "Artwork/yoshi - walking.png"
            frameCount: 4
            frameHeight: 40
            frameWidth: 30
            frameDuration: 100
            to: { "walking": 1, "jumping": 0, "falling": 0 }
        }

        Sprite {
            name: "jumping"
            source: "Artwork/yoshi - jumping.png"
            frameCount: 3
            frameHeight: 40
            frameWidth: 30
            frameDuration: 200
            to: { "jumping-max": 1, "falling": 0 }
        }

        Sprite {
            name: "jumping-max"
            source: "Artwork/yoshi - jumping - max.png"
            frameCount: 1
            frameHeight: 40
            frameWidth: 30
            frameDuration: 200
            to: { "jumping-max": 1, "falling": 0 }
        }

        Sprite {
            name: "falling"
            source: "Artwork/yoshi - falling.png"
            frameCount: 1
            frameHeight: 40
            frameWidth: 30
            frameDuration: 200
            to: { "falling": 1 }
        }

        Sprite {
            name: "landing"
            source: "Artwork/yoshi - landing.png"
            frameCount: 2
            frameHeight: 40
            frameWidth: 30
            frameDuration: 200
            to: { "idle": 1 }
        }
    }

    SpriteSequence {
        id: mirror
        visible: false
        width: parent.width
        height: parent.height
        anchors {
            bottom: parent.bottom
            left: parent.left
        }
        interpolate: false
        goalSprite: ""

        Sprite {
            name: "idle"
            source: "Artwork/yoshi - idle - mirror.png"
            frameCount: 10
            frameHeight: 40
            frameWidth: 30
            frameDuration: 400
            to: { "idle": 1, "waiting": 0.1, "walking": 0, "jumping": 0, "falling": 0}
        }

        Sprite {
            name: "waiting"
            source: "Artwork/yoshi - waiting - mirror.png"
            frameCount: 10
            frameHeight: 40
            frameWidth: 30
            frameDuration: 150
            to: { "idle": 1, "waiting": 0, "walking": 0, "jumping": 0, "falling": 0}
        }

        Sprite {
            name: "walking"
            source: "Artwork/yoshi - walking - mirror.png"
            frameCount: 4
            frameHeight: 40
            frameWidth: 30
            frameDuration: 100
            to: { "walking": 1, "jumping": 0, "falling": 0 }
        }

        Sprite {
            name: "jumping"
            source: "Artwork/yoshi - jumping - mirror.png"
            frameCount: 3
            frameHeight: 40
            frameWidth: 30
            frameDuration: 200
            to: { "jumping-max": 1, "falling": 0 }
        }

        Sprite {
            name: "jumping-max"
            source: "Artwork/yoshi - jumping - max - mirror.png"
            frameCount: 1
            frameHeight: 40
            frameWidth: 30
            frameDuration: 200
            to: { "jumping-max": 1, "falling": 0 }
        }

        Sprite {
            name: "falling"
            source: "Artwork/yoshi - falling - mirror.png"
            frameCount: 1
            frameHeight: 40
            frameWidth: 30
            frameDuration: 200
            to: { "falling": 1 }
        }

        Sprite {
            name: "landing"
            source: "Artwork/yoshi - landing - mirror.png"
            frameCount: 2
            frameHeight: 40
            frameWidth: 30
            frameDuration: 200
            to: { "idle": 1 }
        }
    }

    SequentialAnimation {
        id: jumping
        ParallelAnimation {
            ScriptAction {
                script: {
                    main.goalSprite = "jumping";
                    main.jumpTo("jumping");
                }
            }

            PropertyAnimation {
                target: yoshi;
                property: "y"
                easing.type: Easing.OutExpo
                from: yoshi.parent.stage.ground.y - yoshi.height
                to: 175
                duration: 500
            }
        }

        ParallelAnimation {
            ScriptAction {
                script: {
                    main.goalSprite = "falling";
                    main.jumpTo("falling");
                }
            }

            PropertyAnimation {
                target: yoshi;
                property: "y"
                easing.type: Easing.InExpo
                to: stage.ground.y - yoshi.height
                duration: 500
            }
        }
        ScriptAction {
            script: {
                main.goalSprite = "";
                main.jumpTo("landing");
            }
        }
    }

    onStateChanged: {
        if (state == "RIGHT") {
            mirror.visible = false;
            normal.visible = true;
            main = normal;
        } else {
            normal.visible = false;
            mirror.visible = true;
            main = mirror;
        }
    }
}

