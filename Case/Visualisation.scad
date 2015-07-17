use <Base.scad>
use <Base Spacer.scad>
use <Clear Thin Spacer.scad>
use <Hex Spacer.scad>
use <Screw Terminal Spacer.scad>
use <Screw Terminal Lid.scad>
explosition = 1.7;


color( [0.2,0.2,0.6,.1] ) linear_extrude(2)   base(); // Base
translate([0,0,(2)*explosition]) color( [0.2,0.2,0.2,1] ) linear_extrude(4.5) baseSpacer(); // One Spacer
translate([0,0,(2+4.5)*explosition]) color( "purple" ) linear_extrude(1.6)   base(); // PCB
translate([0,0,(2+4.5+1.6)*explosition]) color( [1,1,.51,.1] ) linear_extrude(3) clearThinSpacer();
translate([0,0,(2+4.5+1.6+3)*explosition]) color( [0.2,0.2,0.2,1] ) linear_extrude(4.5) hexSpacer();
translate([0,0,(2+4.5+1.6+3+4.5)*explosition]) color( [0.2,0.2,0.2,1] ) linear_extrude(4.5) hexSpacer();
translate([0,0,(2+4.5+1.6+3+4.5+4.5)*explosition]) color( [0.2,0.2,0.2,1] ) linear_extrude(4.5) screwTerminalSpacer();
translate([0,0,(2+4.5+1.6+3+4.5+4.5+4.5)*explosition]) color( [0.2,0.2,0.2,1] ) linear_extrude(4.5) screwTerminalSpacer();
translate([0,0,(2+4.5+1.6+3+4.5+4.5+4.5+4.5)*explosition]) color( [0.2,0.2,0.6,.15] ) linear_extrude(2) screwTerminalLid();

