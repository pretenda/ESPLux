$fn = 30;

module dp8049(height)
{
	difference()
	{
		hull()
		{
			translate([80/2-4,49/2-4,0]) cylinder(height,4,4);
			translate([-80/2+4,49/2-4,0]) cylinder(height,4,4);
			translate([80/2-4,-49/2+4,0]) cylinder(height,4,4);
			translate([-80/2+4,-49/2+4,0]) cylinder(height,4,4);
		}
			translate([80/2-4,49/2-4,-1]) cylinder(height+2,3.2/2,3.2/2);
			translate([-80/2+4,49/2-4,-1]) cylinder(height+2,3.2/2,3.2/2);
			translate([80/2-4,-49/2+4,-1]) cylinder(height+2,3.2/2,3.2/2);
			translate([-80/2+4,-49/2+4,-1]) cylinder(height+2,3.2/2,3.2/2);

	}
}

module spacer()
{
difference()
{
	dp8049(3);
	difference()
	{
		translate([0,0,1.5]) cube([80-1.7*2,49-1.7*2, 5], true);
			translate([80/2-4,49/2-4,0]) cylinder(3,3,3);
			translate([-80/2+4,49/2-4,0]) cylinder(3,3,3);
			translate([80/2-4,-49/2+4,0]) cylinder(3,3,3);
			translate([-80/2+4,-49/2+4,0]) cylinder(3,3,3);

			translate([80/2-4,-49/2+4,0]) cube([4,3,3]);
			translate([80/2-4-3,-49/2,0]) cube([8,4,4]);

			translate([-80/2,49/2-4-3,0]) cube([4,8,3]);
			translate([-80/2+4,49/2-4,0]) cube([3,3,3]);
			translate([80/2-4-3,49/2-4,0]) cube([8,4,3]);
			translate([80/2-4,49/2-4-3,0]) cube(3);
			translate([-80/2,-49/2+4,0]) cube([4,3,3]);
			translate([-80/2,-49/2,0]) cube([3+4,4,3]);
	}
}
}
// Lid
translate([0,0,3.1*6+1.7]) difference()
{
dp8049(3);
translate([-40+4,3.81/2,-1]) cylinder(5,1.5,1.5);
translate([-40+4,-3.81/2,-1]) cylinder(5,1.5,1.5);
translate([-40+4,3.81+3.81/2,-1]) cylinder(5,1.5,1.5);
translate([-40+4,3.81*2+3.81/2,-1]) cylinder(5,1.5,1.5);
translate([-40+4,-3.81*2-3.81/2,-1]) cylinder(5,1.5,1.5);
translate([-40+4,-3.81*2+3.81/2,-1]) cylinder(5,1.5,1.5);
}




//Spacer, no cutouts
translate([0,0,3.1*5+1.7]) color("blue") spacer();


//Spacer, no cutouts
translate([0,0,3.1*4+1.7]) color("blue") spacer();



//Spacer, cutouts for header

translate([0,0,3.1*3+1.7]) color("blue") difference()
{spacer();
	translate([-10,0,1.5]) cube([80-1.7*2,22, 5], true);

}

translate([0,0,3.1*2+1.7]) color("blue") difference()
{spacer();
	translate([-10,0,1.5]) cube([80-1.7*2,22, 5], true);

}


//PCB
translate([0,0,3.1*2]) color("white") difference()
{
color("white") dp8049(1.6);
translate([40-3-6.5,-8,-1]) color("white") cube([6.5,16, 3]);
}


//Spacer, no cutouts
translate([0,0,3.1]) color("blue") spacer();

translate([0,0,0]) dp8049(3);


// 7.6