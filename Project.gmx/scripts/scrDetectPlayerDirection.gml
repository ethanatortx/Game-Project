/// scrDetectPlayerDirection(spriteArray, signsArray)

// asign parameters to local variables for readability
var sprArr = argument0;
var signs = argument1

if (signs[1]>0) {
    var outputSprite = spr_main_up;
} else if (signs[1]<0) {
    var outputSprite = spr_main_down;
}

if (signs[0]>0) {
    var outputSprite = sprArr;
} else if (signs[0]<0) {
    var outputSprite = spr_main_left;
}
