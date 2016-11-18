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

// if circleCheckFloat is < 0, it is inside the radius of defined movement
if (circleCheckFloat < 0) {
    // walking code goes here
} 
// if circleCheckFloat is = 0, it is on the radius of defined movement; if it is > 0, it is outside the radius of defined movement
else if (circleCheckFloat >= 0) {
    // running code goes here
}
