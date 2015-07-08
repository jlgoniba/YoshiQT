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

    QQuickView *view = new QQuickView();
    view->setSource(QUrl(QStringLiteral("qrc:/GameView.qml")));
    QObject *gameView = dynamic_cast<QObject*>(view->rootObject());
    QObject *yoshi = gameView->findChild<QObject*>(QString("yoshi"));
    qDebug() << yoshi;
    qDebug() << yoshi->property("x");

    GameLoop gameloop;
    qDebug() << QObject::connect(yoshi, SIGNAL(moveRightSignal()), &gameloop, SLOT(moveRight()));
    return app.exec();
}
