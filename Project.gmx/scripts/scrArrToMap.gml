/// scrArrToMap(spriteArray, keyArray)
// after using this, dont forget to destroy the map created by this script when done using it (conserve memory)

var sprArr = argument0;
var keyArr = argument1;

// create map structure and store id in local variable
var retMap = ds_map_create();

// iterate through array of asset indices
for (i = 0; i < array_length_1d(sprArr); i++) {
    
    // check if provided key name array holds a value in the equivalent index of current asset array index
    if (keyArr[i] == undefined) { // if no key at equivalent index, set key to name of current asset at index [i] of asset array
        var temp = sprite_get_name(sprArr[i]);
    } else {
        var temp = keyArr[i]; // if available, assign key name to equivalent index of provided key array
    }

    // add key:value pair (provided name/asset name: provided asset) to created map id
    ds_map_add(retMap,temp,sprArr[i]);
}

// return id of created data structure
return retMap;
