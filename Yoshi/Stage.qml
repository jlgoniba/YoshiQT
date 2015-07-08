import QtQuick 2.0
import QtMultimedia 5.0

Item {
    anchors.fill: parent
    property alias stage: stage
    property alias ground: ground

    Image {
        id: stage
        width: 5120
        height: 432
        source: "Artwork/Stage/yoshi-stage.png"
    }

    Row {
        id: ground
        width: 5120
        y: stage.height - height
        Image {
            width: 8
            height: 42
            source: "Artwork/Stage/ground-left.png"
        }
        Repeater {
            model: ground.width / 98
            Image {
                width: 98
                height: 42
                source: "Artwork/Stage/ground-middle.png"
            }
        }
        Image {
            width: 8
            height: 42
            source: "Artwork/Stage/ground-right.png"
        }
    }


    //    Audio {
    //        id: stageAudio
    //        source: "Sounds/Music/Super Mario World (SNES) Music - Title Theme.mp3"
    //        autoPlay: true
    //        autoLoad: true
    //        loops: Audio.Infinite
    //    }
}

