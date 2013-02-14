//![0]
var maxObjects = 100;
var ballArray = new Array(maxObjects);
var arrayIndex;

function createObject(filename, parent_obj) {
    var component;

    if (component == null) {
        component = Qt.createComponent(filename);
    }

    if (component.status == Component.Ready) {
        var dynamicObject = component.createObject(parent_obj);
        if (dynamicObject == null) {
            console.log("error creating object");
            console.log(component.errorString());
        }
    } else {
        console.log("error loading component");
        console.log(component.errorString());
    }

    return dynamicObject;
}

function moveBall() {
    var newBall = createObject("Ball.qml",world);
    newBall.x = gameData.getOldBallX();
    newBall.y = gameData.getOldBallY();
    /*console.log("New ball x pos:");
    console.log("newBall.x");
    console.log("New ball y pos:");
    console.log("newBall.y");*/
    ballArray[arrayIndex++] = newBall;
    newBall.activate();
    newBall.move(gameData.getNewMouseX()-30, gameData.getOldBallY(), gameData.getOldBallX(), gameData.getNewMouseY()-30);
    
    setOldBallX(0);
    setOldBallY(0);
    setAimX(0);
    setAimY(0);
}

function createNewBall() {
    var newBall = createObject("Ball.qml",world);
    newBall.x = 100;
    newBall.y = -100;
    ballArray[arrayIndex++] = newBall;
    newBall.activate();
    setOldBallX(0);
    setOldBallY(0);
    setAimX(0);
    setAimY(0);
}
