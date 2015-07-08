#include "gameloop.h"
#include <QQuickView>
#include <QQuickItem>
#include <QDebug>

GameLoop::GameLoop(QObject *parent) : QObject(parent)
{
    qDebug() << "hello";

}

void GameLoop::moveRight()
{


//    // move yoshi up to 75 % of the screen
//    if (yoshi.x + 5 < 640 * 0.75 - yoshi.width / 2) {
//        yoshi.x += 5;
//    }

//    // move the screen  if it can be moved. Otherwise allow yoshi to go all the way to the end
//    if (yoshi.parent.stage.stage.x - 10 >= -(yoshi.parent.stage.stage.width - 640)) {
//        yoshi.parent.stage.stage.x -= 10;
//        yoshi.parent.stage.ground.x -= 10;
//    } else if (yoshi.x + 5 < 640 - yoshi.width / 2) {
//        yoshi.x += 5;
//    }
//    if (yoshi->property("x").toInt() + 5 < 640 * 0.75 - yoshi->property("width").toInt() / 2) {
//        yoshi->setProperty("x", yoshi->property("x").toInt() + 5);
//    }
    qDebug() << "moveRight slot";
}

void GameLoop::moveLeft()
{

}
