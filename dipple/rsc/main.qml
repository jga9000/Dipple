//![0]
import QtQuick 2.0
import com.box2d.release 1.0 as Box2D
import "game.js" as Game

Rectangle {
    property int score: 0
    id: screen
    width: 360
    height: 640
    color: "black"
    
    Image {
        source: "bluepattern.png"
    }
    Image {
        source: "background.png"
    }
    Image {
        x: 190
        y: 200
        width: 90;
        height: 130;
        source: "basket.png"
    }

    Text {
        x: 10
        y: 10
        text: "Drops: "+ score;
        smooth: true
        font.weight: Font.DemiBold
        font.pointSize: 18
        color: "white";
    }

// Define Box2D components

    Box2D.World {

    id: world
    frameTime: 1000 / 60

// Static bounds

    Box2D.Body {
        id: rectangle1
        x: 0
        y: -360
        width: 5
        height: 1000
        bodyType: Box2D.Body.Static
        fixtures: Box2D.Box { anchors.fill: parent }
    }
    Box2D.Body {
        id: rectangle2
        x: 355
        y: -360
        width: 5
        height: 1000
        bodyType: Box2D.Body.Static
        fixtures: Box2D.Box { anchors.fill: parent }
    }
    Box2D.Body {
        id: rectangle3
        x: 5
        y: -360
        width: 350
        height: 5
        bodyType: Box2D.Body.Static
        fixtures: Box2D.Box { anchors.fill: parent }
    }
    Box2D.Body {
        id: rectangle4
        x: 5
        y: 530
        width: 350
        height: 110
        bodyType: Box2D.Body.Static
        fixtures: Box2D.Box { anchors.fill: parent }
    }

// Static basket

   Box2D.Body {
        id: rectangle10
        x: 190
        y: 200
        width: 8
        height: 80
        bodyType: Box2D.Body.Static
        fixtures: Box2D.Box { anchors.fill: parent }
        /*Rectangle {
            anchors.fill: parent
            color: "red"
            border.color: "black"
            border.width: 1
            smooth: true
        }*/
    }
    Box2D.Body {
        id: rectangle11
        x: 270
        y: 200
        width: 8
        height: 80
        bodyType: Box2D.Body.Static
        fixtures: Box2D.Box { anchors.fill: parent }
        /*Rectangle {
            anchors.fill: parent
            color: "red"
            border.color: "black"
            border.width: 1
            smooth: true
        }*/
    }
    /*Box2D.Body {
        id: rectangle112
        x: 192
        width: 85
        y: 200
        height: 20
        bodyType: Box2D.Body.Static
        fixtures: Box2D.Box { anchors.fill: parent }
        Rectangle {
            anchors.fill: parent
            color: "blue"
            border.color: "white"
            border.width: 1
            smooth: true
        }
    }*/
    /*Box2D.Body {
        id: rectangle12
        x: 200
        y: 272
        width: 70
        height: 8
        bodyType: Box2D.Body.Static
        Rectangle {
            anchors.fill: parent
            color: "red"
            border.color: "black"
            border.width: 1
            smooth: true
        }
    }*/


// Balls

    Ball {
        id: ball1
        x: 27
        y: -40
    }

    Ball {
        id: ball2
        x: 137
        y: 0
    }

    Ball {
        id: ball3
        x: 320
        y: -30
    }

    Ball {
        id: ball4
        x: 36
        y: -150
    }

    Ball {
        id: ball5
        x: 300
        y: -100
    }

    Ball {
        id: ball6
        x: 150
        y: -120
    }

    Ball {
        id: ball7
        x: 250
        y: -140
    }

    Ball {
        id: ball8
        x: 90
        y: -120
    }

// Basket net
    Image {
        x: 190
        y: 200
        width: 95;
        height: 130;
        source: "basketnet.png"
    }

}   // Box2D

// Spot (for aiming)
    Item {
        id: spot
        visible: false
        Aim {
            id: aim
        }
    }

// Redraws the aim (angle visual and the shot spot)
    function redrawAim() {
        //console.log("redrawAim")
        aim.newx = gameData.getAimX()-7;
        aim.newy = gameData.getAimY();
        aim.newangle = gameData.getAngle();
        aim.newheight = gameData.getSpeed();
    }

    Image {
        id: exitButton
        x: 320
        y: 10
        source: "exitbutton.png"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                Qt.quit()
            }
        }
    }
}   // Rectangle
