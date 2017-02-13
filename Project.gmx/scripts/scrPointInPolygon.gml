/// scrPointInPolygon(x, y, polygonList)


var posX, posY, pList, bit;
bit = false;

// assign input parameters to local variables
posX = argument0;
posY = argument1;
pList = argument2;

var xArr, yArr, s;
s = ds_list_size(pList) / 2;

// assign list points to separate arrays
for (i = 0; i < s; i++) {
    xArr[i] = ds_list_find_value(pList,i);
    yArr[i] = ds_list_find_value(pList,2*i);
}

// append ending point for checking full loop of polygon
xArr[s] = xArr[0];
yArr[s] = yArr[0];

// initialize points for collision checking
var x1, x2, y1, y2;

// for loop: check points against supplied x,y coord
for (o = 0; o < s; o++) {
    x1 = xArr[o];
    y1 = yArr[o];
    
    x2 = xArr[o+1];
    y2 = yArr[o+1];
    
    // collision checking
    if ((y2 > posY) ^ (y1 > posY)) {
        bit ^= (posX < (x1-x2) * (posY-y2) / (y1-y2) + x2);
    }
}

// return true/false
return bit;
