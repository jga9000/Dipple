#include <QObject>

class GameData : public QObject
{
    Q_OBJECT

private:

public:
    explicit GameData();
    virtual ~GameData();

    Q_INVOKABLE void startGame();
    Q_INVOKABLE QString getScore();
    Q_INVOKABLE void addScore();
    Q_INVOKABLE double getAngle();
    Q_INVOKABLE int getSpeed();

    Q_INVOKABLE int getNewMouseX();
    Q_INVOKABLE int getNewMouseY();
    
    Q_INVOKABLE void setOldBallX(int x);
    Q_INVOKABLE void setOldBallY(int y);
    Q_INVOKABLE int getOldBallX();
    Q_INVOKABLE int getOldBallY();
    
    Q_INVOKABLE void setAimX(int x);
    Q_INVOKABLE void setAimY(int y);
    Q_INVOKABLE int getAimX();
    Q_INVOKABLE int getAimY();
    
private:

private:
    int mScore;
    int mLevel;
    int mOldBallX;
    int mOldBallY;
    int mAimX;
    int mAimY;
};
