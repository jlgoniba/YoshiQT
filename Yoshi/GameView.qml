import QtQuick 2.4

Item {
    anchors.fill: parent
    property variant stage: stage

    Stage {
        id: stage
        anchors.fill: parent
    }

    Yoshi {
        id: yoshi
        width: 30
        height: 40
    }

}
