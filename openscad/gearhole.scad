include <gears.scad>;


//First print, pretty good, bit loose
//gear(2.15,14,20,0);

difference()
{
    cylinder(8,10,10);
    translate([0,0,5]){
        gear(2.13,14,20,0);
    }

}d