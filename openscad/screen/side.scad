$fn = 50;
depth = 20;
vent_radius = depth * 0.20;
border = depth*0.5;
skirt_depth = 5.0;
skirt = 10;
finger_width = 10.1;
finger_depth = skirt_depth + 0.3;
width = 110 - 2* skirt + 2*skirt_depth;
height = 70;
difference(){ 
   main_wall_fingers();
   all_vents();
}

//hinge();
//main_wall_fingers();

module main_wall_fingers() {
  difference()
    {
      finger_offset = 0.0;
      main_wall_with_screws();
      finger_joints(-skirt, finger_width*2.0, height+skirt);
        
      translate([width+2.0*skirt - finger_depth,0,0])  
      finger_joints(-skirt-finger_width, finger_width*2.0, height+skirt);
    }
}

module main_wall_with_screws() {
    difference() {
        main_wall();
        screw_holes();
        hinge();
    }
}

roof_posts();

module roof_posts() {
    post_radius = 3.0;
    post_height = 10.0;
    for(x = [10.0: (width - 20): width])
    {
        translate([x, height + post_height*0.5, post_radius])
        rotate([-90,0,0])
        cylinder(post_height,r=post_radius, center=true);
    }
}

module hinge() {
    hinge_radius = 1.0;
    translate([-skirt + skirt_depth*0.5,-height*0.2,skirt_depth*0.5])
    rotate([-90,0,0])
    cylinder(height+skirt_depth*20,r=hinge_radius);
    
    
    translate([width+skirt - skirt_depth*0.5,-height*0.2,skirt_depth*0.5])
    rotate([-90,0,0])
    cylinder(height+skirt_depth*20,r=hinge_radius);
}

module screw_holes() {
    for(x = [10.0: (width - 20) / 2: width])
    {
       translate([x,-skirt*0.5, -skirt_depth])
       cylinder(skirt_depth*4.0,r=1.5);
    }
}

module main_wall() {
    
     cube([width,height,depth]);   
     translate([-skirt,-skirt,0])
     cube([width + skirt*2.0, height + skirt, skirt_depth]);
}

module finger_joints(start,step, end) {
    clearance = 0.1;
    for(y = [start: step - clearance: end])
    {
        translate([-skirt,y,-skirt_depth*0.5])
        cube([finger_depth,finger_width,skirt_depth * 2.0]);
    }

}


//vent();
//all_vents();

module all_vents()
{
    for(y = [border * 0.5: vent_radius*3.0: height - border * 1.0])
    {
        translate([0,y,0])
        vent();
    }
}


module vent()
{
    translate([width - border*0.5,0,depth*0.5])
    rotate([0,-90,0])
    rotate_extrude(angle = 180) 
    translate([depth*0.5, 0, 0])
    square([vent_radius,width - border]);
}
