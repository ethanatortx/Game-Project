/// scrAttackSwing(cx,cy,px,py,angle,arc,range)

var cx,cy,a,l,px,py;

// origin of the arc
cx = argument0;
cy = argument1;

// point to check
px = argument2;
py = argument3;

// angle offset for hit detection
a = argument4%90;

// range of attack
range = argument5;

// length of swing arc
arcl = argument6;
arca = radtodeg(arcl/range);

var temp;
list = ds_list_create();

for (i = 0; i < 4; i++) {
    switch (i) {
        case 0: temp[0] = 0; temp[1] = 0; break;
        case 1: temp = scrRotatePoint(a,range,0); break;
        case 2: temp = scrRotatePoint(a+(arca/2),range,0); break;
        case 3: temp = scrRotatePoint(a+arca,range,0); break;
    }
    ds_list_insert(list,i,cx+temp[0]);
    ds_list_add(list,cy+temp[1]);
}

if (scrPointInPolygon(px,py,list)) {
    //ds_list_destroy(list);
    temp[0] = true;
} else {
    //ds_list_destroy(list);
    temp[0] = false;
}

temp[1] = list;

return temp;
