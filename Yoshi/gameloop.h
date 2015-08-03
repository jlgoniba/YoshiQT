#ifndef GAMELOOP_H
#define GAMELOOP_H

#include "yoshi.h"

#include <QObject>
#include <QDebug>

class GameLoop : public QObject
{
    Q_OBJECT
public:
    explicit GameLoop(QObject *parent = 0);

public slots:
   void onMoveRight(QObject *);
   void onMoveLeft(QObject *);
};

#endif // GAMELOOP_H
