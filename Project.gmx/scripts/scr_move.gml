/// scr_move
// argument0 = device used for input

// input
var pad_num = gamepad_get_device_count();
var gp = undefined; // initialize var gp as a local variable for future use

for (i = 0; i < pad_num; i ++) {
    gp[i] = gamepad_is_connected(i); // get array of devices and whether or not they are gamepad inputs
}

if (gp[argument0] = true) { // if specified device slot is gamepad or not
    var gpinput = true; 
} else {
    var gpinput = false;
}

if (gpinput) {
    // gamepad axis assignment
    gamepad_set_axis_deadzone(0,0.2)
    var vaxis = gamepad_axis_value(argument0, gp_axislv);
    var haxis = gamepad_axis_value(argument0, gp_axislh);
} else if (!gpinput) {
    // keyboard axis assignment
    var rkey = keyboard_check(vk_right);
    var lkey = keyboard_check(vk_left);
    var ukey = keyboard_check(vk_up);
    var dkey = keyboard_check(vk_down);

    // set axis movement
    // vertical axis assignment
    if (ukey && !dkey) {
        var vaxis = -1;
    }
    if (!ukey && dkey) {
        var vaxis = 1;
    }
    if (!ukey && !dkey or ukey && dkey) {
        var vaxis = 0;
    }
    // horizontal axis assignment
    if (rkey && !lkey) {
        var haxis = 1;
    }
    if (!rkey && lkey) {
        var haxis = -1;
    }
    if (!rkey && !lkey or rkey && lkey) {
        var haxis = 0;
    }
}

// speed determination
if ((vaxis < 0.6 and vaxis > -0.6) && (haxis < 0.6 and haxis > -0.6)) { // check if player stick movement is in walking zone (radius < .6)
    vspd = ceil(vaxis);
    hspd = ceil(haxis);
    if (vaxis < 0.6 and vaxis > 0) {
        sprite_index = spr_main_down_walking;
        spr_resting = spr_main_down_still;
        image_speed = .175;
    } else if (vaxis > -0.6 and vaxis < 0) {
        sprite_index = spr_main_up_walking;
        spr_resting = spr_main_up_still;
        image_speed = .175;
    }
    if (haxis < 0.6 and haxis > 0) {
        sprite_index = spr_main_right_walking;
        spr_resting = spr_main_right_still;
        image_speed = .175;
    } else if (haxis > -0.6 and haxis < 0) {
        sprite_index = spr_main_left_walking;
        spr_resting = spr_main_left_still;
        image_speed = .175;
    }
} else { // do running animation when stick movement is past walking zone (radius >= 0.6)
    vspd = round(2*vaxis);
    hspd = round(2*haxis);
    if (vaxis > 0.6) {
        sprite_index = spr_main_down;
        spr_resting = spr_main_down_still;
        image_speed = .2;
    } else if (vaxis < -0.6) {
        sprite_index = spr_main_up;
        spr_resting = spr_main_up_still;
        image_speed = .2;
    }
    if (haxis > 0.6) {
        sprite_index = spr_main_right;
        spr_resting = spr_main_right_still;
        image_speed = .2;
    } else if (haxis < -0.6) {
        sprite_index = spr_main_left;
        spr_resting = spr_main_left_still;
        image_speed = .2;
    }
}

if (haxis == 0 and vaxis == 0) { // if no movement, cease animation and stand still
    sprite_index = spr_resting;
    image_speed = 0;
    image_index = 0;
} 

// movement
phy_position_x += hspd;
phy_position_y += vspd;


