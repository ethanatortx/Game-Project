/// scrRotateRectangle(angle,length,width)

var dir = argument0;
var length = argument1;
var width = argument2;

// rotate thing
var p1, p2, p3, p4;

// declare points with x1:y1 at origin

// top left corner
p1[0] = 0;
p1[1] = 0;

//top right corner
p2[0] = length;
p2[1] = 0;

// bottom right corner
p3[0] = length;
p3[1] = width;

// bottom left corner
p4[0] = 0;
p4[1] = width;

// transform points
p1Trans = scrRotatePoint(dir,p1[0],p1[1]); // tl corner
p2Trans = scrRotatePoint(dir,p2[0],p2[1]); // tr corner
p3Trans = scrRotatePoint(dir,p3[0],p3[1]); // br corner
p4Trans = scrRotatePoint(dir,p4[0],p4[1]); // bl corner

var pGrid = ds_grid_create(2,4);

// assign grid positions to coordinates (each row is an x:y pair for the rectangle)
for (o = 0; o < ds_grid_height(pGrid); o++) {
    for (i = 0; i < ds_grid_width(pGrid); i++) {
        switch (o) {
            case 0: ds_grid_set(pGrid,i,o,p1Trans[i]); break;
            case 1: ds_grid_set(pGrid,i,o,p2Trans[i]); break;
            case 2: ds_grid_set(pGrid,i,o,p3Trans[i]); break;
            case 3: ds_grid_set(pGrid,i,o,p4Trans[i]); break;
        }
    }
}

return pGrid;
