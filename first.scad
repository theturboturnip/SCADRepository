b = 23;
module banana( b )
{
 union()
 {
  rotate( [45,60,0] ) cylinder(h=b, r=10);
  translate( [0,0,-4] ) scale([1,3,1]) cube(20);
 }
}

banana(b=5);

translate([30,0,0]) banana(b=20);
