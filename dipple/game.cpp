#include <QCoreApplication>
#include <QDir>
#include <QFileInfo>
#include <QQmlComponent>
#include <QQmlEngine>
#include <QQmlContext>
#include <QDebug>

#include <QtCore/qmath.h>
#include <QPoint>
#include <QCursor>
#include "game.h"

GameData::GameData() {

    qDebug() << "GameData()";

    mScore = 0;
    mLevel = 0;
    mOldBallX = 0;
    mOldBallY = 0;
    mAimX = 0;
    mAimY = 0;
}

GameData::~GameData()
{
}

int GameData::getNewMouseX()
{
    QPoint pos = QCursor::pos();
    //qDebug() << "getNewMouseX:" << pos.x();
    return pos.x();
}

int GameData::getNewMouseY()
{
    QPoint pos = QCursor::pos();
    //qDebug() << "getNewMouseY:" << pos.y();
    return pos.y();
}

double GameData::getAngle()
{
    int x(getAimX()-getNewMouseX());
    int y(getNewMouseY()-getAimY());
    //qDebug() << "xwidth:" << x;
    //qDebug() << "ywidth:" << y;

    qreal tan = qAtan2(qreal(x), qreal(y));
    qreal angle = tan * 180 / M_PI;

    //qDebug() << "getAngle:" << angle;
    return angle;
}

int GameData::getSpeed()
{
    int x(getNewMouseX()-getAimX());
    int y(getNewMouseY()-getAimY());
    //qDebug() << "x:" << x;
    //qDebug() << "y:" << y;
    double speed = double(sqrt(double(x*x+y*y)));
    speed = speed*0.5;

    //qDebug() << "speed:" << (int)speed;
    if(speed>160) speed = 160;
    return int(speed);
}

void GameData::setOldBallX(int x)
{
    //qDebug() << "setOldBallX:" << x;
    mOldBallX = x;
}

void GameData::setOldBallY(int y)
{
    //qDebug() << "setOldBallY:" << y;
    mOldBallY = y;
}

int GameData::getOldBallX()
{
    //qDebug() << "getOldBallX:" << mOldBallX;
    return mOldBallX;
}

int GameData::getOldBallY()
{
    //qDebug() << "getOldBallY:" << mOldBallY;
    return mOldBallY;
}

void GameData::setAimX(int x)
{
    //qDebug() << "setAimX:" << x;
    mAimX = x;
}

void GameData::setAimY(int y)
{
    //qDebug() << "setAimY:" << y;
    mAimY = y;
}

int GameData::getAimX()
{
    //qDebug() << "getAimX:" << mAimX;
    return mAimX;
}

int GameData::getAimY()
{
    //qDebug() << "getAimY:" << mAimY;
    return mAimY;
}

QString GameData::getScore()
{
    QString num;
    QString toReturn;
    
    toReturn += num.setNum(mScore);
    return toReturn;
}

void GameData::addScore()
{
    mScore++;
}

void GameData::startGame()
{
}
