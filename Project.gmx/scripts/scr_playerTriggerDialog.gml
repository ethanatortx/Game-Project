/// player interaction with world objects

var xpos = argument0;
var ypos = argument1;
var obj = argument2;

if (keyboard_check_pressed(vk_enter)) {
    if (place_meeting(xpos, ypos, obj)) {
        newMessage = instance_create(0,0,obj_message);
        newMessage.text = "Hello World!";
        newMessage.font = fnt_comicSans;
        newMessage.horPos = view_xview[0] + (view_wview[0] / 2);
        newMessage.vertPos = view_yview[0] + (view_hview[0] / 2);
    }
}
