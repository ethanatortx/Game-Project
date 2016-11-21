/// scrMoveGamepad(hspd, vspd, haxis, vaxis, walkThreshold);


// assign parameters to local variables to increase readability;
var hspd = argument0;
var vspd = argument1;

var haxis = argument2;
var vaxis = argument3;

var r = argument4; // circle radius

// checking inside radius
var circleCheckFloat = (sqr(haxis) + sqr(vaxis) - sqr(r)); // gives float for whether the axis movement is inside or outside the circle

// get signs of the axis movement to determine direction
var signs;
signs[0] = sign(haxis);
signs[1] = sign(vaxis);

// quadrant
var quadrant;

if (haxis > 0 and vaxis <= 0) { // top right
    quadrant = 0;
} else if (haxis  <= 0 and vaxis < 0) { // top left
    quadrant = 1;
} else if (haxis < 0 and vaxis >= 0) { // bottom left
    quadrant = 2;
} else if (haxis >= 0 and vaxis > 0) { // bottom right
    quadrant = 3;
}

// var angle; // angle relative to intial position on axis circle
var angle = (radtodeg(arctan((signs[1]*vaxis)/(signs[0]*haxis))));

var neg = power(-1,quadrant); // put quadrant code into t/f format (-1,1) : quadrants 1/3 are -1, quadrants 0,2 are 1

// invert angle if in designated negative quadrants
if (neg<0) {
    if (angle != 0) {
        angle = 90 - angle;
    }
}

angle += (90*quadrant); // increase in relation to initial side

// if circleCheckFloat is < 0, it is inside the radius of defined movement
if (circleCheckFloat < 0) {
    var newHorizontalSpd = hspd * global.walkSpeedMod;
    var newVerticalSpd = vspd * global.walkSpeedMod;
}

// if circleCheckFloat is = 0, it is on the radius of defined movement; if it is > 0, it is outside the radius of defined movement
else if (circleCheckFloat >= 0) {
    var newHorizontalSpd = hspd;
    var newVerticalSpd = vspd;
}

var relativeSpeed; // speed at angle
relativeSpeed = sqrt(sqr(newHorizontalSpd) + sqr(newVerticalSpd));

direction = angle; // set angle to angle of joystick
speed = relativeSpeed; // set speed to hypotenuse of joystick angle and both axes
