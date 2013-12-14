module shuriken_quarter(){
	//A triangle
	difference(){
		cube(1);
		translate([0.5,-0.5,-0.5])rotate([0,0,45])scale([0.75,2,2])cube(1);	
	}
}
module shuriken_half(){
	//A parallelogram
	union(){
		translate([-1.5,-0.5,0])shuriken_quarter();
		rotate([0,0,180])translate([-1.5,-0.5,0])shuriken_quarter();
		translate([-0.5,-0.5,0])scale([1,1,1])cube(1);
	}
}
module full_shuriken(){
	//The plain shuriken, no aesthetic elements
	union(){
		shuriken_half();
		rotate([0,0,90])shuriken_half();
	}
}
module shuriken_hole_mould(size){
	//A mould for the hole inside of the shuriken
	union(){
		scale([1,1,3])translate([-size/2+size,-size/2,-size/2])cube(size);
		scale([1,1,3])translate([-size/2-size,-size/2,-size/2])cube(size);
		rotate([0,0,90])union(){
			scale([1,1,3])translate([-size/2+size,-size/2,-size/2])cube(size);
			scale([1,1,3])translate([-size/2-size,-size/2,-size/2])cube(size);
		}
	}
}
module shuriken_hole(size){
	//The cube for the hole in the middle of the shuriken
	difference(){
		rotate([0,0,45])scale([1,1,2])translate([-size/2,-size/2,-size/2])cube(size);
		shuriken_hole_mould(size);
	}
}
module shuriken(size){
	//The complete shuriken, with aesthetics
	difference(){
		scale([size*(1/0.7),size*(1/0.7),0.3*size])full_shuriken();
		shuriken_hole(size);
	}
}
shuriken(0.7);
