/// scrCorrectAngle(cx, cy, px, py)

var cx, cy, px, py, xdif, ydif;
cx = argument0;
cy = argument1;
px = argument2;
py = argument3;

xdif = px-cx;
ydif = py-cy;

var sx, sy, quadrant, angle;
sx = sign(xdif);
sy = sign(ydif);
quadrant = 0;

if (xdif > 0 and ydif <= 0) { // top right
    quadrant = 0;
} else if (xdif  <= 0 and ydif < 0) { // top left
    quadrant = 1;
} else if (xdif < 0 and ydif >= 0) { // bottom left
    quadrant = 2;
} else if (xdif >= 0 and ydif > 0) { // bottom right
    quadrant = 3;
}

switch (quadrant) {
    case 0:
        angle = darctan( (sy*ydif) / (sx*xdif) );
        angle += 90*quadrant;
        break;
    case 2:
        angle = darctan( (sy*ydif) / (sx*xdif) );
        angle += 90*quadrant;
        break;
    case 1:
        angle = darctan( (sx*xdif) / (sy*ydif) );
        angle += 90*quadrant;
        break;
    case 3:
        angle = darctan( (sx*xdif) / (sy*ydif) );
        angle += 90*quadrant;
        break;
}

return angle;
