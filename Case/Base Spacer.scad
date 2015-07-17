$fn = 30;
// 5.02 wide
module standoff()
{
//hexagon(5.02/2);
circle(3.2/2, $fn = 30);
}
module hexagon(length) { width = 2 * length * tan(30); union() { square(size = [ length * 2, width ], center = true); rotate(a = [ 0, 0, 60 ]) { square(size = [ length * 2, width ], center = true); } rotate(a = [ 0, 0, -60 ]) { square(size = [ length * 2, width ], center = true); } } }

module baseSpacer() {
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

}
}
baseSpacer();