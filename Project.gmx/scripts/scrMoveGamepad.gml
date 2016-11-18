/// scrMoveGamepad(hspd, vspd, runAnimSpeed, haxis, vaxis);

// assign parameters to local variables to increase readability;
var hspd = argument0;
var vspd = argument1;

var runAnimSpd = argument2;

var haxis = argument3;
var vaxis = argument4;

// assign default directional movement sprites
var rSpr = spr_main_right;  // right
var lSpr = spr_main_left;   // left
var uSpr = spr_main_up;     // up
var dSpr = spr_main_down;   // down

var r = 0.6; // circle radius

// checking inside radius
var circleCheckFloat = (sqr(haxis) + sqr(vaxis) - sqr(r)); // gives float for whether the axis movement is inside or outside the circle

// get signs of the axis movement to determine direction
var signs;
signs[0] = sign(haxis);
signs[1] = sign(vaxis);

// quadrant
var quadrant;
if (signs[0] == (1 || 0) && signs[1] == 1) { quadrant = 0; }
if (signs[0] == -1 && signs[1] == (1 || 0)) { quadrant = 1; }
if (signs[0] == (-1 || 0) && signs[1] == -1) { quadrant = 2; }
if (signs[0] == 1 && signs[1] == (-1 || 0)) { quadrant = 3; }

var angle; // angle relative to intial position on axis circle
angle = radtodeg(arctan((signs[1]*vaxis)/(signs[0]*haxis))) + (90 * quadrant);

// if circleCheckFloat is < 0, it is inside the radius of defined movement
if (circleCheckFloat < 0) {
    var newHorizontalSpd = hspd * .6;
    var newVerticalSpd = vspd * .6;
} 
// if circleCheckFloat is = 0, it is on the radius of defined movement; if it is > 0, it is outside the radius of defined movement
else if (circleCheckFloat >= 0) {
    var newHorizontalSpd = hspd;
    var newVerticalSpd = vspd;
}

var relativeSpeed; // speed at angle
relativeSpeed = sqrt(sqr(newHorizontalSpd) + sqr(newVerticalSpd));

direction = angle;
speed = relativeSpeed;
