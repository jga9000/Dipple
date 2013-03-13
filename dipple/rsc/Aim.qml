import QtQuick 2.0

import "game.js" as Game

Item {
    property real newangle: gameData.getAngle();
    property int newx;
    property int newy;
    property int newheight: gameData.getSpeed();
    id: direction
    property int shotimagex;
    property int shotimagey;

    /*Image {
        x: shotimagex
        y: shotimagey
        id: shotimage
        width: 60;
        height: 60;
        source: "shot.png"
        smooth: true
    }*/

    Image {
        x: newx
        y: newy
        source: "angle.png"
        smooth: true
        height: newheight
        transform: Rotation {
            id: rotation
            origin.x: 7;
            angle: newangle
        }
    }
}
