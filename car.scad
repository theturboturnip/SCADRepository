carHeight=20;
carWidth=25;
module wheel()
{
    rotate( [90,90,0] ) cylinder(h=1,r=5);
}
module windsheild(t,l)
{
    rotate( [0,45,0] ) scale( [3,5,t] ) cube(l);
}   
module carBody(wst,wsl)
{
    union()
    {
        translate( [5,0,10] ) windsheild(t=wst,l=wsl);
        scale( [5,5,2] ) translate( [-4,0,0] ) cube(wsl);
        scale( [7,5,2] ) translate( [-2.85,0,-5] ) cube(wsl);
    }
}
module chassis()
{
    union()
    {
        translate( [9,0,-9] ) wheel();
        translate( [-13,0,-9] ) wheel();
        translate( [9,26,-9] ) wheel();
        translate( [-13,26,-9] ) wheel();
    }
}    
module carModel()
{
    union()
    {   
        carBody(wst=0.1,wsl=5);
        chassis();
    }
}
module car(scl,t,r)
{
    rotate( r ) scale( [scl,scl,scl] ) translate( t ) carModel();
}
car(scl=1,t=[0,0,0],r=[0,0,0]);
//car(scl=1,t=[0,-carWidth,-carHeight],r=[0,180,180]);
