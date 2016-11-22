/// scrTransformRectangleAtAngle(angle,x1,y1,x2,y2)

var angle = argument0;

var x1 = argument1;
var y1 = argument2;

var x2 = argument3;
var y2 = argument4;

var len = x2-x1;

var width = y2-y1;

var diag = sqrt(sqr(x2-x1) + sqr(y2-y1));
var diagAngle = (arccos(length/diag));

var point1;
var point2;
var point3;
var point4;

point1[0] = x1;
point1[2] = y1;

point2[0] = x1 + cos(angle)*length;
point2[1] = y1 + sin(angle)*length;

point3[0] = x2 + diag - cos(angle)*diag;
point3[1] = y2 +  sin(angle)*diag;

point4[0] = x1 + sin(angle)*width;
point4[1] = y1 + cos(angle)*width;
