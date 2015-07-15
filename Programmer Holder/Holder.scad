$fn = 30;
difference()
{
union()
{
translate([-3,-3,0]) cube([6,9,21]);
hull()
{
translate([-3,2,0]) cube([6,4,1]);
translate([-3,2,10]) cube([28.5,4,1]);
translate([-3-6+41,2,0]) cube([6,3,1]);
translate([-3+35,1.5,10]) cube([6,3,1]);
}
translate([-3+35,-3,0]) cube([6,6,11]);
hull()
{
translate([-3+22.5,-3+3,20]) cube([6,6,1]);
translate([-3+22.5,-1+3,10]) cube([6,4,11]);
}
}

translate([0,0,-1]) cylinder(8,3/2,3/2);
translate([35,0,-1]) cylinder(8,3/2,3/2);
translate([0,3,15]) cylinder(12,3/2,3/2);
translate([22.5,3,15]) cylinder(12,3/2,3/2);
}