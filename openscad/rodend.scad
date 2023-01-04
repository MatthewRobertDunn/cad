 
height = 25;
inner = 6.4;
outer = 9.0;

$fn=100; 

difference(){    
     union() {
        sphere(outer + 3);
        cylinder(h=height, r1=outer, r2=outer, center=false);
     }
translate([0,0,height / 2.0]) cylinder(h=height + 0.1, r1=inner, r2=inner, center=true); 

 } 
 
      
