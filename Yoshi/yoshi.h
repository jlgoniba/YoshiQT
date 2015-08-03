#ifndef YOSHI_H
#define YOSHI_H

#include <QQuickItem>
#include "gameloop.h"

class YoshiItem : public QQuickItem
{
    Q_OBJECT
public:
    YoshiItem();

signals:
    void moveRight();
    void moveLeft();
};

#endif // YOSHI_H
