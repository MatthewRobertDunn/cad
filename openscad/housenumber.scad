
linear_extrude(height = 10)
scale([20.0,20.0,20.0])
{
    text("53", font = "Liberation Sans:style=Bold");
}


translate([80,0,0])
cube([130,10,5]);

translate([80,181,0])
cube([130,10,5]);