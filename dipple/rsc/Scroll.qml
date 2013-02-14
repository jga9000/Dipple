import QtQuick 1.0

Image {
    id: scrolltext
    property int speed: 10000
    x: 0
    y: 0
    source: "gameon.png"

    PropertyAnimation on y {
        from: 640
        to: -500
        duration: speed
    }
}