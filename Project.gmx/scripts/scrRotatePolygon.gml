/// scrRotatePolygon(angle,pointList)

//  rotate supplied polygon on supplied angle
//
//      angle = angle of rotation for the polygon in relation
//              to the initial angle
//  pointList = ID for list containing all points of polygon
//              in format <x1,x2,...,y1,y2,...);

// assign input paramaters to local variables for readability
var a = argument0;
var pList = argument1;

// create list for transformed points
var retList = ds_list_create();

// get points in order to transform polygon so that x1,x2 is at origin: 0,0
var x0, y0;
x0 = ds_list_find_value(pList,0);
y0 = ds_list_find_value(pList,ds_list_size(pList) div 2);

// define variable to hold rotated point values
var temp;

// accesor for loop to iterate through supplied point list
for (i = 0; i < ds_list_size(pList)/2; i++) {
    
    // rotate current point x[i], y[i] : index i, 2i
    temp = scrRotatePoint(a, ds_list_find_value( pList, i ) - x0, ds_list_find_value( pList, i + (ds_list_size(pList)/2) ) - y0);
    
    // add transformed points to new list
    ds_list_insert( retList, i, temp[0] + x0 );
    ds_list_add( retList, temp[1] + y0 );
}

// return list of transformed points in same format
return retList;
