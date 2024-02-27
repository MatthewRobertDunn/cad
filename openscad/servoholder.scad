$fn=100;
total_width = 30;
total_length = 54.5;
length_sans_tabs = 40.0;
screw_length = 49.50;
screw_height = 10.0;
width_sans_tabs = 20;
depth = 3.0;
screw_holes = 2;

support_tail = 25.0;
total_support_length = 131.0;
support_length = 131.0 - support_tail - total_length;


servo_mount();

difference()
{
    support_frame();
    support_holes();
}

module support_holes()
{
   translate([0,-total_length*0.5 - support_tail + 10,0])
   cylinder(depth*2.0, screw_holes, center=true);
    
    translate([0,total_length*0.5 + (support_length - 10),0])
    cylinder(depth*2.0, screw_holes, center=true);
}
    



module support_frame()
{
    translate([0,-total_length*0.5 - (support_tail *0.5),0])
    cube([total_width,support_tail,depth], center=true);

    translate([0,total_length*0.5 + (support_length *0.5),0])
    cube([total_width,support_length,depth], center=true);
}



module servo_mount()
{
    difference()
    {
        frame();
        screw_holes();
        screw_holes(-1);
    }
}

module frame() 
{
    difference()
    {
        cube([total_width,total_length,depth], center=true);
        cube([width_sans_tabs,length_sans_tabs,depth+4], center=true);
    }

}



module screw_holes(x = 1) 
{
    translate([0,screw_length*0.5 * x,0])
    {
        translate([screw_height * 0.5,0,0])
        cylinder(depth*2.0,screw_holes, center=true);
        translate([-screw_height * 0.5,0,0])
        cylinder(depth*2.0,screw_holes, center=true);
        
    }

}