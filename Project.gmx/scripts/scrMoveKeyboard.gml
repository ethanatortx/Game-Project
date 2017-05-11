/// scrMoveKeyboard(hspd, vspd, keyList);

// key array format must be [left, right, up, down]

// assign input parameters to local variables for readability
var hspd = argument0;
var vspd = argument1;
var keyList = argument2; // which keys to check for input

var spr = global.playerSprArr[0];

var lkey = keyboard_check(keyList[0]);
var rkey = keyboard_check(keyList[1]);
var ukey = keyboard_check(keyList[2]);
var dkey = keyboard_check(keyList[3]);

var haxis = 0;
var vaxis = 0;

var hactual = 0;
var vactual = 0;

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

if(haxis != 0 || vaxis != 0)
{
    hactual = hspd*haxis;
    vactual = vspd*vaxis;
    
    // down and right -- right
    if(haxis == 1 && vaxis == 1)
    {
        spr = global.playerSprArr[3];
    }
    // right -- right
    if(haxis == 1 && vaxis == 0)
    {
        spr = global.playerSprArr[3];
    }
    // up and right -- right
    if(haxis == 1 && vaxis == -1)
    {
        spr = global.playerSprArr[3];
    }
    // down -- down
    if(haxis == 0 && vaxis == 1)
    {
        spr = global.playerSprArr[0];
    }
    // up -- up
    if(haxis == 0 && vaxis == -1)
    {
        spr = global.playerSprArr[1];
    }
    // down and left -- left
    if(haxis == -1 && vaxis == 1)
    {
        spr = global.playerSprArr[2];
    }
    // left -- left
    if(haxis == -1 && vaxis == 0)
    {
        spr = global.playerSprArr[2];
    }
    // up and left -- left
    if(haxis == -1 && vaxis == -1)
    {
        spr = global.playerSprArr[2];
    }
}

scrIncrementGlobalPlayerPos(hactual, vactual);
sprite_index = spr;
