#include "yoshi.h"
#include "gameloop.h"
#include <QQuickView>
#include <QQuickItem>
#include <QDebug>

const int SCREEN_SIZE = 640;

struct Yoshi {
    QObject * object;
    const int DISPLACEMENT = 5;
    int x;
    int y;
    int width;
};

struct Ground {
    QObject * object;
    int x;
};

struct Stage {
    QObject * object;
    int x;
    int y;
    int width;
    Ground ground;
};

Yoshi yoshi;
Stage stage;

GameLoop::GameLoop(QObject *parent) : QObject(parent)
{
}

void updateGameObjects(QObject * main)
{
    // setup yoshi
    yoshi.object = main->findChild<QObject*>("yoshi");
    yoshi.x = yoshi.object->property("x").toInt();
    yoshi.y = yoshi.object->property("y").toInt();
    yoshi.width = yoshi.object->property("width").toInt();

    // setup stage
    QObject *stageMain = main->findChild<QObject*>("stage");
    stage.object = stageMain->findChild<QObject*>("stage");
    stage.ground.object = stageMain->findChild<QObject*>("ground");
    stage.x = stage.object->property("x").toInt();
    stage.y = stage.object->property("x").toInt();
    stage.width = stage.object->property("width").toInt();
    stage.ground.x = stage.ground.object->property("x").toInt();
}

void GameLoop::onMoveRight(QObject *main)
{
    updateGameObjects(main);
    // move yoshi up to 75 % of the screen
    if (yoshi.x + 5 < SCREEN_SIZE * 0.75 - yoshi.width / 2)
    {
        yoshi.x += 5;
        yoshi.object->setProperty("x", yoshi.x);
    }

    // move the screen  if it can be moved. Otherwise allow yoshi to go all the way to the end
    if (stage.x - 10 >= -(stage.width - SCREEN_SIZE))
    {
        stage.x -= 10;
        stage.ground.x -= 10;
        stage.object->setProperty("x", stage.x);
        stage.ground.object->setProperty("x", stage.ground.x);
    }
    else if (yoshi.x + 5 < SCREEN_SIZE - yoshi.width / 2)
    {
        yoshi.x += 5;
        yoshi.object->setProperty("x", yoshi.x);
    }
}

void GameLoop::onMoveLeft(QObject *main)
{
    updateGameObjects(main);
        // move yoshi up to 25 % of the screen
        if (yoshi.x - 5 > SCREEN_SIZE * 0.25 - yoshi.width / 2)
        {
            yoshi.x -= 5;
            yoshi.object->setProperty("x", yoshi.x);
        }

        // move the screen  if it can be moved. Otherwise allow yoshi to go all the way to the end
        if (stage.x + 10 <= 0)
        {
            stage.x += 10;
            stage.object->setProperty("x", stage.x);
        } else if (yoshi.x - 5 > 0)
        {
            yoshi.x -= 5;
            yoshi.object->setProperty("x", yoshi.x);
        }

}

