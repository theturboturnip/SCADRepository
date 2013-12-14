// First version has feet that are too thin; change from 0.1 to 0.4
// Arms are too short, were 4 long and are now 6

$fs=01;
module tail_part()
{
	rotate( [0,0,90] ) scale([0.25,1.5,1]) cube(4);
}
module pikachu_tail()
{
	translate( [5,0,0] ) scale( [2,1,1] ) tail_part();
	translate( [-3,0,3] ) scale( [1.5,1,1.5] ) tail_part();
	translate( [-6,0,6] ) scale( [2,1,2] ) tail_part();
}
module pikachu_arm()
{
    rotate( [160,0,0] ) cylinder(r=1,h=6);
}
module pikachu_arms()
{ 	
	rotate( [180,0,0] ) translate( [0,-4,2] ) pikachu_arm();
    rotate( [180,0,180] ) translate( [0,-3.75,2] ) pikachu_arm();
}
module pikachu_ears()
{
    translate( [0,-2.5,0] ) rotate( [45,-35,0] ) scale( [0.25,0.5,1.5] ) sphere(4);  
    translate( [0,2.5,0] ) rotate( [-45,-35,0] ) scale( [0.25,0.5,1.5] ) sphere(4);  
}
module pikachu_head()
{
    sphere(5);
    translate( [0,0,5] ) pikachu_ears();
}
module pikachu_body()
{
    //cylinder(r=4.5,h=10);
    //scale( [0.75,1,1.5] ) sphere(5);
    translate( [0,0.25,0] ) scale( [1,1,1.5] ) sphere(5);
	translate( [0,0,2] ) pikachu_arms();
}
module pikachu_foot()
{
    intersection()
    {
        translate([-5,-5,0]) cube( [10,10,10] );
        scale( [1,0.5,0.4] ) sphere(2.5);
    }
}
module pikachu_feet()
{
    translate( [0,2.5,0] ) rotate( [0,0,45] ) pikachu_foot();
    translate( [0,-2.5,0] ) rotate( [0,0,-45] ) pikachu_foot();
}
module pikachu()
{
    translate( [0,0,8.5] ) pikachu_head();
    intersection()
    { 
        translate([-25,-25,-6.5]) cube( [50,50,50] );
        pikachu_body();
    }
	rotate( [0,15,0] ) translate( [-4,0,-4] ) pikachu_tail();
    translate( [0,0,-6.5] ) pikachu_feet();
	//rotate( [90,0,0] ) translate( [-15,-6.55,0] ) pikachu_tail();
}

scale(2) difference()
{
 pikachu();
 rotate( [0,15,0] ) translate( [-4,0,-4] ) pikachu_tail();
}

*scale([2,2,1.8]) rotate([90,0,0]) pikachu_tail();
