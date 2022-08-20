$fn = 50;

e = 0.01;

t = 1;
d = 15;
d2 = 8;
h = 12.5;
l = 55;
tab = 3.5;

// number of batteries
n = 4;

w = n*(d+t) + t;


module battery () {
    translate([t+d/2,t,t+d/2])
    difference() {
    union() {
        // main battery body
        translate([-d/2,2*t,0])
        cube([d,l-4*t,d/2]);
        
        translate([0,2*t,0])
        rotate([-90,0,0])
        cylinder(l-4*t,d/2,d/2);
        
        // terminals
        translate([-d/2,0,-d/2])
        cube([d,t,d]);
        
        translate([-d/2,l-t,-d/2])
        cube([d,t,d]);
        
        // terminal contacts
        translate([-d2/2,0,0])
        cube([d2,l,d/2]);
        
        rotate([-90,0,0])
        cylinder(l,d2/2,d2/2);
        
        // terminal tabs
        translate([-tab/2,-t-e,-d/2-t*3+e])
        cube([tab,t*2+e,t*3]);
        
        translate([-tab/2,l-t,-d/2-t*3+e])
        cube([tab,t*2+e,t*3]);
    }
    /*
    translate([-d/2-e,t,-d/2-e])
        cube([d+2*e,t,d+2*e]);
    }
    */
}
    
}

difference() {
    cube([w,l+2*t,h+t]);

    for(i=[0:n-1]) {
        translate([i*(d+t),0,0])
        battery();
    }
}

//!battery();