/// scr_player_is_facing

var sprite = obj_player_main.sprite_index;

if (string_count("up",sprite) > 0) {
    return 0;
} else if (string_count("right",sprite) > 0) {
    return 1;
} else if (string_count("down",sprite) > 0) {
    return 2;
} else if (string_count("left",sprite) > 0) {
    return 3;
} else {
    return -1;
}
