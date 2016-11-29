/// scrPredictCourse(instance, steps)

// script for calculating projectile paths
// only works for physics objects
{
    var instance,steps,dsid,posx,posy,hspd,vspd,grvx,grvy,spd,dir;
    instance = argument0;
    steps = argument1;
    dsid = ds_list_create();
    with (instance) {
        posx = x;
        posy = y;
        hspd = phy_position_x - phy_position_xprevious;
        vspd = phy_position_y - phy_position_yprevious;
        grvx = lengthdir_x(gravity,gravity_direction);
        grvy = lengthdir_y(gravity,gravity_direction);
        repeat (steps) {
            spd = point_distance(0,0,hspd,vspd);
            spd = max(0, spd-friction)/spd;
            hspd *= spd;
            vspd *= spd;
            hspd += grvx;
            vspd += grvy;
            posx += hspd;
            posy += vspd;
            ds_list_add(dsid,posx);
            ds_list_add(dsid,posy);
        }
    }
    return dsid;
}
