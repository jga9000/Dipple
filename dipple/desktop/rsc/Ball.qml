import QtQuick 1.0
import com.box2d.release 2.0 as Box2D
import "game.js" as Game
import "newball.js" as Ball

Box2D.Body {
    id: bodyrectangle
    width: 60
    height: 60
    x: 100
    y: 100
    property int hasMoved: 0

    MouseArea {
        anchors.fill: parent

        onPressed: {
            console.log("pressed")        
            gameData.setAimX(parent.x+30);
            gameData.setAimY(parent.y+30);
            gameData.setOldBallX(parent.x);
            gameData.setOldBallY(parent.y);
            hasMoved = 1;
            bodyimage.source = ""
            bodyrectangle.changePosition(-100, -100);
        }
        
        onPositionChanged: {
            screen.redrawAim();
            spot.visible = true;
        }
        onReleased: {
            console.log("released")
            if( hasMoved ) {
                hasMoved = 0
                bodyrectangle.stop()
                bodyimage.source = ""
                Ball.moveBall(); // Creates new
            }
            spot.visible = false
        }
        Image {
            id: bodyimage
            anchors.fill: parent
            smooth: true
            source: "ball.png"
        }
    }

    Timer {
        interval: 200
        running: true
        repeat: true
        onTriggered: {
            calcScore();
        }
    }
    function calcScore() {
        if( bodyrectangle.x > 175 && bodyrectangle.x < 230 &&
            bodyrectangle.y > 190 && bodyrectangle.y < 230 )
        {
            console.log("x:");
            console.log(bodyrectangle.x);
            console.log("y:");
            console.log(bodyrectangle.y);

            hasMoved = 0;
            bodyrectangle.stop();
            bodyimage.source = "";
            bodyrectangle.x = 100;
            bodyrectangle.y = -100;            
            screen.score++;
            Ball.createNewBall();
            
        }
    }
}
