$fn=50;
length = 150;
width = 110;
skirt_depth = 5.0;
first_hole= 15.0;
floor_depth = 3;
border_height = 10;
border_width = 3.0;
//screw_holes_width();

difference()
{
floor_screws();
    for(x = [10: 10: length - 10])
    for(y = [10: 10: width - 10])
    {
        translate([x,y])
        cube([5,5,50],center=true);
    }
}


module floor_screws()
{
    difference()
    {
        main_floor();
        screw_holes_length();
        translate([0,width,0])
        screw_holes_length();
        
        screw_holes_width();
        translate([length,0,0])
        screw_holes_width();
    }
}

module screw_holes_length() {
    for(x = [first_hole: (length - 20 - 10) / 2: length])
    {
       translate([x,-5, 5])
        rotate([-90,0,0])
       cylinder(10,r=1.5);
    }
}

module screw_holes_width() {
    for(y = [first_hole: (width - 20 - 10) / 2: width])
    {
       translate([5,y, 5])
        rotate([0,-90,0])
       cylinder(10,r=1.5);
    }
}



module main_floor()
{
    difference()
    {
        cube([length,width,border_height]);

        translate([border_width,border_width,floor_depth])
        cube([length-border_width*2.0,
            width-border_width*2.0,
            border_height - floor_depth + 1]);
    }
}
        
