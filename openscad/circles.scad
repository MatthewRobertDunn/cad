FootWidth = 67.0 + 1;
FootLength = 152 + 1;
FootWalls = 10;
WallWidth = 3;

CutterWidth = 3;
CutterLength = 30;
CutterOffset = 47;
HoleRadius = 145 / 2;
difference()
{
    foot();
    cutter();
}

difference()
{
    arm();
    pivot_hole();
}

module pivot_hole()
{
    translate([HoleRadius,CutterOffset,0]){
        cylinder(h=100,d=3.5,center=true,$fn=50);
    }
}

module arm()
{
    depth = (FootWalls + WallWidth);
    ArmWidth = 30 ;
    ArmLength = HoleRadius + 10 -(FootWidth + WallWidth * 2) / 2;
    translate([FootWidth / 2 + WallWidth,
                CutterOffset - ArmWidth / 2,
                -depth / 2]){
        cube([ArmLength,ArmWidth,depth * 0.5]);
    }
}


module cutter(){
    translate([0,CutterOffset,0]){
    cube([CutterWidth,CutterLength,FootWalls*2],true);
    }
}

module foot() {
difference() {
    cube([FootWidth + WallWidth * 2, FootLength + WallWidth * 2, WallWidth + FootWalls],true);

        translate([0,0,WallWidth]){
            cube([FootWidth, FootLength, WallWidth + FootWalls], true);
        }
    }
}



