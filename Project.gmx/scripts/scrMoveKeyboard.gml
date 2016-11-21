/// scrMoveKeyboard(hspd, vspd, keyList);

// assign input parameters to local variables for readability
var hspd = argument0;
var vspd = argument1;
var keyList = argument2; // which keys to check for input

var j = 0; // assign j to 0 : counting variable for pressed keys array
var pressedKeys;

for (i = 0; i < array_length_1d(keyList); i++) {
    var tempKey = keyboard_check(keyList[i]);
    pressedKeys[j] = tempKey;
    j++;
}

