import QtQuick 2.0
import com.box2d.release 1.0 as Box2D
import "game.js" as Game

Box2D.Body {
    id: bodyrectangle
    fixedRotation: false
    sleepingAllowed: true
    bodyType: Box2D.Body.Dynamic
    property int hasMoved: 0
    property int hasScored: 0

    fixtures: Box2D.Circle {
        id: circleShape
        radius: 30
        anchors.fill: parent
        density: 0.001;
        friction: 5;
        restitution: 0.5;
    }

    Rectangle {
        id: itemShape
        radius: width/2
        width: 60
        height: 60
        x: circleShape.x - circleShape.radius
        y: circleShape.y - circleShape.radius

        MouseArea {
            anchors.fill: parent

            onPressed: {
                console.log("pressed")
                gameData.setAimX(bodyrectangle.x);
                gameData.setAimY(bodyrectangle.y);
                gameData.setOldBallX(bodyrectangle.x);
                gameData.setOldBallY(bodyrectangle.y);
                hasMoved = 1;
                hasScored = 0;
                bodyrectangle.changePosition(gameData.getNewMouseX(), gameData.getNewMouseY());
                bodyrectangle.stop()
            }

            onPositionChanged: {
                screen.redrawAim();
                spot.visible = true;
            }
            onReleased: {
                console.log("released")
                if( hasMoved ) {
                    hasMoved = 0
                    bodyrectangle.activate()
                    bodyrectangle.changePosition(gameData.getOldBallX(), gameData.getOldBallY());
                    bodyrectangle.applyLinearImpulse(
                                                    Qt.point( 0.012*(gameData.getOldBallX()-gameData.getNewMouseX()),
                                                              0.012*(gameData.getOldBallY()-gameData.getNewMouseY()) ),
                                                    Qt.point( gameData.getOldBallX(), gameData.getOldBallY() )
                                                    )
                    setOldBallX(0);
                    setOldBallY(0);
                    setAimX(0);
                    setAimY(0);
                }
                spot.visible = false
            }
            Image {
                id: bodyimage
                anchors.fill: parent
                smooth: true
                source: "ball.png"
            }
        }   //MouseArea
    }   // Rectangle
    Timer {
        interval: 100
        running: true
        repeat: true
        onTriggered: {
            calcScore();
        }
    }   // Timer
    function calcScore() {
        if( bodyrectangle.x > 188 && bodyrectangle.x < 280 &&
            bodyrectangle.y > 200 && bodyrectangle.y < 240 &&
            hasScored == 0 )
        {
            console.log("SCORED!! x:");
            console.log(x);
            console.log("y:");
            console.log(y);

            hasMoved = 0;
            hasScored = 1;
            screen.score++;
        }
    }   // function

}   //Body
