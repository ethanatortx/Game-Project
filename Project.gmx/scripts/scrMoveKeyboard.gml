/// scrMoveKeyboard(hspd, vspd, keyList);

// key array format must be [left, right, up, down]

// assign input parameters to local variables for readability
var hspd = argument0;
var vspd = argument1;
var keyList = argument2; // which keys to check for input

var spr;

var lkey = keyboard_check(keyList[0]);
var rkey = keyboard_check(keyList[1]);
var ukey = keyboard_check(keyList[2]);
var dkey = keyboard_check(keyList[3]);

var haxis = 0;
var vaxis = 0;

if (lkey and !rkey) {
    haxis = -1;
} else if (!lkey and rkey) {
    haxis = 1;
} else {
    haxis = 0;
}

if (ukey and !dkey) {
    vaxis = -1;
} else if (!ukey and dkey) {
    vaxis = 1;
} else {
    vaxis = 0;
}

var angle;
var relativeSpd;

if (haxis == 0 && vaxis == 0) { // no input
    spr = sprite_index;
    angle = direction;
    relativeSpd = 0;
}

if (haxis == 1 && vaxis == 0) { // straight right
    spr = spr_main_right;
    relativeSpd = hspd;
    angle = 0;
}

if (haxis == 1 && vaxis == -1) { // right and up diagonal
    spr = spr_main_up;
    relativeSpd = sqrt(sqr(hspd) + sqr(vspd));
    angle = 45;
}

if (haxis == 0 && vaxis == -1) { // straight up
    spr = spr_main_up;
    relativeSpd = vspd;
    angle = 90;
}

if (haxis == -1 && vaxis == -1) { // left and up diagonal
    spr = spr_main_up;
    relativeSpd = sqrt(sqr(hspd) + sqr(vspd));
    angle = 135;
}

if (haxis == -1 && vaxis == 0) { // straight left
    spr = spr_main_left;
    relativeSpd = hspd;
    angle = 180;
}

if (haxis == -1 && vaxis == 1) { // bottom and left diagonal
    spr = spr_main_down;
    relativeSpd = sqrt(sqr(hspd) + sqr(vspd));
    angle = 225;
}

if (haxis == 0 && vaxis == 1) { // straight down
    spr = spr_main_down;
    relativeSpd = vspd;
    angle = 270;
}

if (haxis == 1 && vaxis == 1) { // down and right diagonal
    spr = spr_main_down;
    relativeSpd = sqrt(sqr(hspd) + sqr(vspd));
    angle = 315;
}

direction = angle;
speed = relativeSpd;
