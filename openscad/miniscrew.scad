$fn=100; 
hex_radius = 3.9;
body_height = 25;
body_radius = 6.1;


difference()
{
    difference(){
        cylinder(body_height,body_radius,body_radius);
        translate([0,0,-0.01]){
            cylinder(r=hex_radius, h=13.5, $fn=6);
        }
    }


    translate([0,0, 15 + hex_radius * 1.1]){
        rotate([0,90,0]){
           cylinder(r=hex_radius, h=33.5, center=true, $fn=6);
        }
    }
}

translate([0,0, body_height]){
cylinder(8,3,3, $fn=6);
}
