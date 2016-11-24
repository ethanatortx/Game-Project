/// scrRotatePoint(angle,x1,y1)
// returns two item array of points: x',y'

// assign input parameters to local variables for readability
var angle = argument0;
var x1 = argument1;
var y1 = argument2;

// rotate point on angle
var point;
point[0] = x1*cos(angle) - y1*sin(angle);
point[1] = x1*sin(angle) + y1*cos(angle);

// return point array
return point;
