let textX = 50;
let textY = 0;
textDown = true;

function setup() {
    createCanvas(400, 400);
}

function draw() {
    background(220);
    textSize(50);
    if (textY >= 400) {
        textDown = false
    }

    if (textY <= 0) {
        textDown = true
    }

    if (textDown) {
        textY++
    } else {
        textY--
    }

    text('p5 works', textX, textY);
}