use <threads.scad>


//ballSocket();

//cap();

//ballCap(11);
//translate([0,0,-48])
ballRod(11);

//ball(10);

//ballRod(11);

//rotate([0,180,0])
//translate([0,0,-48]){
    //ballCap(11);
//}


/*
ballCap();

translate([50,0,0]){
    ballRod();
}

translate([100,0,0]){
    ball();
}
*/



module ballCap(ballRadius = 10) {
    wallThickness = ballRadius * 0.5;
    
    ScrewHole(ballRadius * 2.0 + wallThickness * 0.6, ballRadius + ballRadius * 0.25)
    {
       difference() {
        cylinder(r=ballRadius + wallThickness * 1.2, h=ballRadius * 1.5, $fn=6);
        translate([0,0,ballRadius * 1.5 - ballRadius * 0.55])
        sphere(ballRadius);  
        }
    }
}


module ballRod(ballRadius = 10) {
    wallThickness = ballRadius * 0.5;
    screwDiameter = ballRadius * 2.0 + wallThickness * 0.6;
    difference()
    {
        ScrewThread(screwDiameter, ballRadius * 1.2);
        translate([0,0,ballRadius * 1.8])
        sphere(ballRadius);  
    }
    translate([0,0,-ballRadius * 1.0])
    cylinder(r=ballRadius + wallThickness * 1.4, h=ballRadius * 1.0, $fn=6);
}


module ball(ballRadius = 10){
    cylinder(h=ballRadius * 3.0, r=ballRadius * 0.5, $fn=100);
    translate([0,0,ballRadius * 3.0])
    sphere(ballRadius);
    
}




/*

module ballSocket(diameter = 20, length = 20) {
    difference()
    {
        ScrewThread(diameter, length);
        sphere((diameter / 2.0 ) * 0.7);
    }
}


module cap(diameter = 20) 
{
    ScrewHole(diameter, 20){
        translate([0,0,10])
        cylinder(r=diameter, h=10, $fn=6);
    }
    
}

*/