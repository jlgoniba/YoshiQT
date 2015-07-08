#ifndef GAMELOOP_H
#define GAMELOOP_H

#include <QObject>
#include <QDebug>

class GameLoop : public QObject
{
    Q_OBJECT
public:
    explicit GameLoop(QObject *parent = 0);
    void moveLeft();
signals:

public slots:
    void moveRight();
};

#endif // GAMELOOP_H
