/// scr_directional_input

// gets 4 digit binary, 0000-1111, each digit representing on/off input
var mov_input = ((keyboard_check(vk_left)<<3) | (keyboard_check(vk_right)<<2) | (keyboard_check(vk_up)<<1) | keyboard_check(vk_down));

// change speed to make an illusion of 3 speed at 60 fps
/*if (global.player_speed == 1) {
    global.player_speed = 2;
} else if (global.player_speed == 2) {
    global.player_speed = 1;
}*/

// sets speed for movement in specified direction
var spd_arr = scr_move_arr(mov_input, global.player_speed);

// move the player
phy_position_x += spd_arr[0];
phy_position_y += spd_arr[1];

image_speed = 0;

// decide animation direction
if (phy_position_y != phy_position_yprevious) {
    if (phy_position_y > phy_position_yprevious) {
        sprite_index = spr_main_down_run; // show moving down
        image_speed = .15;
    } else if (phy_position_y < phy_position_yprevious) {
        sprite_index = spr_main_up_run; // show moving upwards
        image_speed = .15;
    }
}

// NOTE:
// because of the way this is coded, 
// if the player is moving diagonally
// they will always animate in either 
// the right or left animation strips.

if (phy_position_x != phy_position_xprevious) {
    if (phy_position_x > phy_position_xprevious) {
        sprite_index = spr_main_right_run; // show moving right
        image_speed = .15;
    } else if (phy_position_x < phy_position_xprevious) {
        sprite_index = spr_main_left_run; // show moving left
        image_speed = .15;
    }
}

if (mov_input == 0000 || mov_input == 1111) {
    image_index = 0;
}
/// scr_run_kbm
/// different animation for running and walking
