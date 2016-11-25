/// scrRotatedRectangleCollision(pointGrid, angle, x, y)

// assign input parameters to local variables for readability
var grid = argument0;
var count = ds_grid_height(grid);
var angle = argument1;
var posX = argument2; // x pos to check
var posY = argument3; // y pos to check


var p1, p2, p3, p4;

for (o = 0; o < ds_grid_height(grid); o++) {
    for (i = 0; i < ds_grid_width(grid); i++) {
        switch (o) {
            case 0: p1[i] = ds_grid_get(grid,i,o); break;
            case 1: p2[i] = ds_grid_get(grid,i,o); break;
            case 2: p3[i] = ds_grid_get(grid,i,o); break;
            case 3: p4[i] = ds_grid_get(grid,i,o); break;
        }
    }
}

var vec1, vec2, vec3, vec4;
var l, w;

l = point_distance(p1[0],p1[1],p2[0],p2[1]);
w = point_distance(p1[0],p1[1],p4[0],p4[1]);


