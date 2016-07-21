/// scr_player_getup

// argument0 = speed for getting up animation

// end animation
if (image_index < sprite_get_number(sprite_index) - .9 && image_index > sprite_get_number(sprite_index) - 1.1) {
    image_speed = 0;
    // set state to enable walking after animation changes
    global.player_state = 'walk';
} else {
    image_speed = argument0;
}
