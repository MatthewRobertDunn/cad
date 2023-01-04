use <threads.scad>


//nut();
//back();
plate();



module plate()
{
    difference() {
    cube([40,40,5]);
    translate([9,5,-10])
    cube([20+2,10+2,20]);
}
}

module nut() {
    ScrewHole(20, 20){
        translate([0,0,10])
        cylinder(r=20, h=10, $fn=6);
    }
}


module back()
{
    difference(){
        backPlate(70);
        rotate([90,0,0]){
            cylinder(h=20,r=6,center=true);
        }
    };
}

module backPlate(plateLength = 70, plateDepth = 10, screwLength = 30)
{
    
    difference() {
        union() {
            cube([20,plateDepth,plateLength],center=true);
            translate([0,0,plateLength / 2]){
            ScrewThread(20, screwLength);
            }
        }
        
        union() {
            translate([0,-plateDepth,0]) 
            cube([20,plateDepth, (plateLength + screwLength) * 2.0], true);
        
            translate([0,plateDepth,0]) 
            cube([20,plateDepth, (plateLength + screwLength) * 2.0], true);
        }
    }
    
    translate([0,20 - plateDepth / 2.0,-plateLength / 2.0 - 2.5]) {
        cube([40,40, 5], true);
    }
}