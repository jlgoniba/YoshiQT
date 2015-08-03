#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QObject>
#include <QQuickItem>
#include <QDebug>
#include "yoshi.h"
#include "gameloop.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<YoshiItem>("com.luis.yoshi", 1, 0, "YoshiItem");
    qmlRegisterType<GameLoop>("com.luis.yoshi", 1, 0, "GameLoop");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

//    QQuickView *view = new QQuickView();
//    view->setSource(QUrl(QStringLiteral("qrc:/GameView.qml")));
//    QObject *gameView = dynamic_cast<QObject*>(view->rootObject());
//    GameLoop gameLoop;
//    YoshiItem *yoshi = qobject_cast<YoshiItem*>(gameView->findChild<QObject*>(QString("yoshi")));


    return app.exec();
}
