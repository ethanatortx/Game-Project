/// player interaction with world objects

//argument0 :: what direction the object needs to be interacted from (0,1,2,3,-1 :: -1 is not facing direction);

if (scr_player_is_facing() == argument0) {
    var keyCheck = keyboard_check(vk_enter);
    if (keyCheck) {
        return true;
    }
}
