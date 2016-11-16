/// player interaction with world objects

var xpos = argument0;
var ypos = argument1;
var obj = argument2;
global.boolVal = false;

if (keyboard_check_pressed(vk_enter) or keyboard_check(ord("Z"))) {
    if (place_meeting(xpos, ypos, obj)) {
        global.boolVal = true;
    }
}

