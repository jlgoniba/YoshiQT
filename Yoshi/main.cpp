#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QObject>
#include <QQuickItem>
#include <QDebug>
#include "gameloop.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    QQuickView view(QUrl("qrc:/GameView.qml"));
    QObject *gameView = view.rootObject();
    QObject *yoshi = gameView->findChild<QObject*>(QString("yoshi"));
    qDebug() << yoshi;
    qDebug() << yoshi->property("x");

    GameLoop gameloop;
    qDebug() << QObject::connect(yoshi, SIGNAL(moveRightSignal()), &gameloop, SLOT(moveRight()));
    return app.exec();
}
