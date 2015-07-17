// 5.02 wide
$fn = 30;
module standoff()
{
//hexagon(5.02/2);
circle(3.2/2, $fn = 30);
}
module hexagon(length) { width = 2 * length * tan(30); union() { square(size = [ length * 2, width ], center = true); rotate(a = [ 0, 0, 60 ]) { square(size = [ length * 2, width ], center = true); } rotate(a = [ 0, 0, -60 ]) { square(size = [ length * 2, width ], center = true); } } }

module clearThinSpacer()
{
difference()
{
	hull()
	{
		translate([-35+4,-43/2+4]) circle(4);
		translate([35-4,-43/2+4]) circle(4);
		translate([-35+4,43/2-4]) circle(4);
		translate([35-4,43/2-4]) circle(4);
	}
	translate([31, 43/2-4]) rotate([0,0,-15]) standoff();
	translate([31, -43/2+4]) rotate([0,0,15]) standoff();
	translate([-31, 43/2-4]) rotate([0,0,15]) standoff();
	translate([-31, -43/2+4]) rotate([0,0,-15]) standoff();
square([70-6, 43-16], true);
square([70-16, 43-6], true);

translate([25-.5,-11.5+.5]) rotate([0,0,45]) square(10, true);
translate([-31,0]) square(16.5, true);
}

}
 clearThinSpacer();