/// scr_player_is_facing

var sprite = sprite_get_name(obj_player_main.sprite_index); // get current player sprite as a string

// search for direction keywords to determine direction player is facing
if (string_count("up",sprite) > 0) {
    return 0;
} else if (string_count("right",sprite) > 0) {
    return 1;
} else if (string_count("down",sprite) > 0) {
    return 2;
} else if (string_count("left",sprite) > 0) {
    return 3;
} else {
    return -1; // return -1 if the player's sprite is not one of the four directional movement sprites
}
