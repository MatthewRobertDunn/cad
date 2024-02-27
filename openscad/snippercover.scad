$fn=200;
MaterialThickness = 2.5;
PlaneHeight = 10.2;

mainDish();
innerCoupler();
outerCoupler();

small_tab();
rotate([0,0,180])
small_tab();

rotate([0,0,90])
tall_tab();

rotate([0,0,90+180])
tall_tab();


reinforceHeight = 4;
translate([0,0,PlaneHeight  - reinforceHeight])
ring(30,40, reinforceHeight);


module ring(innerDiameter, outerDiameter, height) {
    difference() {
        cylinder(r = outerDiameter, h = height);
        translate([0, 0, -0.5]) 
        cylinder(r = innerDiameter, h = height + 1);    
    }
}


module tall_tab() {
    outer_radius = 38.0;
    width = 1.5 * 2.0;  // width of rectangle
    height = 26.25;   // height of rectangle
    r = outer_radius - width;       // radius of the curve
    a = 43;       // angle of the curve

    rotate([0,0,(60 - a) / 2])
    translate([0,0,PlaneHeight])
    rotate_extrude(angle = a) translate([r, 0, 0]) square(size = [width, height], center = false);
}



module small_tab() {
    outer_radius = 38.0;
    width = 1.65;   // width of rectangle
    height = 3.7;   // height of rectangle
    r = outer_radius - width;       // radius of the curve
    a = 60;       // angle of the curve

    translate([0,0,PlaneHeight])
    rotate_extrude(angle = a) translate([r, 0, 0]) square(size = [width, height], center = false);
}


module outerCoupler()
{
    inner_radius = 32.22 / 2.0;
    height = 5.9;
    wall_thickness = 1.40;
    cutting_offset = 1.32;
    
    translate([0,0,PlaneHeight - height - cutting_offset])
    {
        difference(){
            cylinder(h=height, r=inner_radius + wall_thickness, center=false);
            cylinder(h=20, r=inner_radius,center=true);
        }
    }
}


module innerCoupler()
{
    inner_radius = 7.8 / 2.0;
    wall_thickness = 1.76;
    height = 7.9;
    translate([0,0,PlaneHeight - height])
    {
        difference(){
            cylinder(h=height, r=inner_radius + wall_thickness, center=false);
            cylinder(h=20, r=inner_radius,center=true);
        }
    }
}
module mainDish()
{
    difference()
    {
        mainRadius = 84;
        difference() 
        {
            translate([0, 0, mainRadius])
            sphere(r = mainRadius);
            
            translate([-500,-500,PlaneHeight])
            cube(size = [1000, 1000, 1000], center = false);            
        }
            
        translate([0, 0, mainRadius + MaterialThickness])
        sphere(r = mainRadius, $fn=100);

    }
}