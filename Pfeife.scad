$fn = 100;

b   = 20;       // Breite der Pfeife
l   = 32;       // Laenge der Pfeife
h   = 10;       // Hoehe der Pfeife
d   = 7.5;      // Durchmesser Pfeifenloecher
lr  = 31.5;     // Laenge rechtes Pfeifenloch
ll  = 30;       // Laenge linkes Pfeifenloch
w   = 31;       // Winkel der Pfeifenlochschraege


// Pfeife ohne Mundstueck
difference()
{
    // Pfeifenkoerper nach oben auf Null verschieben
    translate([ 0, 0, h/2])
    {
        // Pfeifenkoerper soll liegen
        rotate([ 0, 90, 0])
        {
            // runder Pfeifenkoerper
            cylinder( l, b/2, b/2);

            // rundes Ende fuers Band
            translate([ 0, 0, l])
                sphere(b/2);
        }
    }

    // untere Abflachung
    translate([ -b/2, -b/2, -h])
        cube([ l+b, b, h]);

    // obere Abflachung
    translate([ -b/2, -b/2, h])
        cube([ l+b, b, h]);

    // gebogenes Loch fuer Band od Schluesselring
    translate([ l+2*h+b/4, 0, h/2])
        rotate_extrude(convexity = 10)
            translate([2*h, 0, 0])
                circle(d* 2/5);

    // linkes Pfeifenloch
    translate([ -1, +b/4, h/2])
        rotate([ 0, 90, 0])
            cylinder( ll+1, d/2, d/2);

    // rechtes Pfeifenloch
    translate([ -1, -b/4, h/2])
        rotate([ 0, 90, 0])
            cylinder( lr+1, d/2, d/2);

    // Schraege am rechten Loch
    translate([ -b, -(b-b/4), -1])
        rotate([ 0, 0, -w])
            cube([ l, b-b/15, h+2]);

    // Schraege am linken Loch
    mirror([ 0, 1, 0])
        translate([ -b, -(b-b/4), -1])
            rotate([ 0, 0, -w])
                cube([ l, b-b/15, h+2]);
}

// Mundstueck zur Pfeife
translate([-b*2/3,0,0])
difference()
{
    // liegnden Koerper nach oben auf Null verschieben
    translate([ 0, 0, h/2])
        rotate([ 0, 90, 0])
            cylinder( b*2/3, b/2, b/2);

    // untere Abflachung
    translate([ -b/2, -b/2, -h])
        cube([ l+b, b, h]);

    // obere Abflachung
    translate([ -b/2, -b/2, h])
        cube([ l+b, b, h]);

    // linkes Pfeifenloch
    translate([ -1, +b/4, h/2])
        rotate([ 0, 90, 0])
            cylinder( ll+1, d/2, d/2);

    // rechtes Pfeifenloch
    translate([ -1, -b/4, h/2])
        rotate([ 0, 90, 0])
            cylinder( lr+1, d/2, d/2);
}

// Verengung im Mundstueck
translate([ -b/2, 0, 0])
difference()
{
    // 2 Zylinder wirken als Duese
    translate([ 0, 0, 0])
    {
        translate([ 0, -d/2, h/2])
            rotate([ 0, 90, 0])
                cylinder( b/2, d/2, d/2);

        translate([ 0, d/2, h/2])
            rotate([ 0, 90, 0])
                cylinder( b/2, d/2, d/2);
    }

    // Schraege am linken Loch
    mirror([ 0, 1, 0])
        translate([ -b*2/3, -(b-b/4), -1])
            rotate([ 0, 0, -40])
                cube([ l, b, h+2]);

    // Schraege am rechten Loch
    translate([ -b*2/3, -(b-b/4), -1])
        rotate([ 0, 0, -40])
            cube([ l, b, h+2]);
}

// Die SCHRIFT
translate([ 0, 0, 0])
{
    // bei Groessenaenderung muss hier per Hand
    // nachgeregelt werden. Automatisch per 
    // Variablen wird das nicht klappen
    translate([ -b/2, -b/2 +9, h])
        linear_extrude(0.8)
            text("Die",5,"Folio Xbd BT");

    translate([b/8, -b/2 +7, h])
        linear_extrude(0.8)
            text("PARTEI", 7,"Folio Xbd BT");
}
