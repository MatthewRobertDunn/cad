// CSG.scad - Basic example of CSG usage
$fn=100; 
    wallThickness = 3;  //Thickness of walls
    halfWall = wallThickness / 2;
    depth = 20;         //depth of bracket


clamp(5,5,3,3,10,1.7);

//stand();
module stand(width=50,depth=20,height=20,wallThickness=3)
{
    halfWall = wallThickness / 2;
    
    cube([width,depth,wallThickness]);
    
    translate([width/2 - halfWall,0,0]){
        cube([wallThickness,depth,height]);
    }
    translate([width/2,depth,height + 5.3 + wallThickness -2])
    {
        rotate([90,0,0]){
            clamp(5.3);
        }
    }
}


module clamp(holeRadius, depth=20, gap=3, wallThickness = 3,tabSize=10,screwRadius=1.7)
{
    halfWall = wallThickness / 2;
    difference()
    {   
        cylinder(depth,holeRadius + wallThickness,holeRadius + wallThickness);
        cylinder(depth*2 + 5,holeRadius,holeRadius,center=true);
        translate([-gap/2, holeRadius - halfWall,-5]){
            cube([gap,wallThickness+2,depth + 20]);
        }
    }
    
    difference()
    {
        union()
        {
            translate([gap/2,holeRadius-0.3,0]){
                cube([wallThickness,tabSize,depth]);
            }
            
            translate([-gap/2 -wallThickness,holeRadius-0.3,0]){
                cube([wallThickness,tabSize,depth]);
            }
        }
        
        translate([0,holeRadius+wallThickness + tabSize/2 - screwRadius,depth/2])
            {
                rotate([0,90,0]){
                    cylinder(holeRadius*2,screwRadius,screwRadius, center=true);
                }
            }
    }
}


/*
translate([-24,0,0]) {
    union() {
        cube(15, center=true);
        sphere(10);
    }
}

intersection() {
    cube(15, center=true);
    sphere(10);
}

translate([24,0,0]) {
    difference() {
        cube(15, center=true);
        sphere(10);
    }
}
*/

echo(version=version());
// Written by Marius Kintel <marius@kintel.net>
//
// To the extent possible under law, the author(s) have dedicated all
// copyright and related and neighboring rights to this software to the
// public domain worldwide. This software is distributed without any
// warranty.
//
// You should have received a copy of the CC0 Public Domain
// Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
