// diameter=53; // PLA
// height=5.6; // PLA
// thickness=0.6; // PLA
// opening=51.75; // PLA

// diameter=53; // TPU
// height=5.6; // TPU
// thickness=0.6; // TPU
// opening=48; // TPU

diameter=54; // TPU
height=6.4; // TPU
thickness=1; // TPU
opening=49; // TPU

/*difference(){
    cylinder(height,diameter/2,diameter/2);
    translate([0,0,thickness]) cylinder(height-thickness*2,diameter/2-thickness,diameter/2-thickness);
    translate([0,0,thickness*2]) cylinder(height-thickness*2,opening/2-thickness,opening/2-thickness);
}*/

// r[adius], h[eight], [rou]n[d]
module rounded_cylinder(r,h,n) {
  rotate_extrude(convexity=1) {
    offset(r=n) offset(delta=-n) square([r,h]);
    square([n,h]);
  }
}

difference() {
    rounded_cylinder(r=diameter/2,h=height,n=3.1,$fn=120);
    translate([0,0,thickness]) rounded_cylinder(r=diameter/2-thickness*2,h=height-thickness*2,n=2.0,$fn=120);
    translate([0,0,height/2]) cylinder(height-thickness*2,opening/2-thickness,opening/2-thickness,$fn=120);
}

