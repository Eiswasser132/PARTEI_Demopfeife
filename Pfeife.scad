$fn = 100;

h   = 10;   // Hoehe
b   = 20;   // Breite
l   = 40;   // Laenge (ohne Mundstueck)
ml  = 10;   // Laenge des Mundstuecks
d   = 4.5;    // Durchmesser Luftroehre
ll  = 30;   // Laenge Rohr links
lr  = 27;   // Laenge Rohr rechts

// Pfeifenkoerper ohne Mundstueck
difference()
{
    // einpacken, damit es ein Koerper wird, von dem abgezogen wird
    translate([ 0, b/4, 0])
    {
        // rechteckiger Grundkoerper
        cube([ l, b/2, h]);

        // rechte Rundung
        translate([ 0, 0, h/2])
            rotate([ 0, 90, 0])
                cylinder( l, h/2, h/2);

        // linke Rundung
        translate([ 0, b/2, h/2])
            rotate([ 0, 90, 0])
                cylinder( l, h/2, h/2);

        // hintere Rundung
        translate([ l, b/2, h/2])
            rotate([ 90, 0, 0])
                cylinder( b/2, h/2, h/2);

        // rechte hintere Rundung
        translate([ l, 0, h/2])
            sphere(h/2);

        // linke hintere Rundung
        translate([ l, b/2, h/2])
            sphere(h/2);
    }

    // rechtes Rohr
    translate([ -1, b/4 + 0, h/2])
        rotate([ 0, 90, 0])
            cylinder( lr, d, d);

    // linkes Rohr
    translate([ -1, b/4 + b/2, h/2])
        rotate([ 0, 90, 0])
            cylinder( ll, d, d);

    // Schnurloch hinten
    translate([ l, l/2, h/2])
        rotate([ 90, 0, 0])
            cylinder( l/2, h/4, h/4);

    // rechtes Tonloch
    translate([ -b/10, b/4 + 0 , h/2])
        rotate([ 90, 0, 30])
            cylinder( h, 1.25*d, 1.25*d);

    // linkes Tonloch
    translate([ -b/10, b/4 + b/2 , h/2])
        rotate([ 270, 0, -30])
            cylinder( h, 1.25*d, 1.25*d);
}


// das Mundstueck
translate([ -ml, b/4, 0])
{
    difference()
    {
        // einpacken wie oben
        translate([ 0, 0, 0])
        {
            // rechteckiger Grundkoerper
            cube([ ml, b/2, h]);

            // rechte Rundung
            translate([ 0, 0, h/2])
                rotate([ 0, 90, 0])
                    cylinder( ml, h/2, h/2);

            // linke Rundung
            translate([ 0, b/2, h/2])
                rotate([ 0, 90, 0])
                    cylinder( ml, h/2, h/2);
        }
        // rechtes Rohr
        translate([ -1, 0, h/2])
            rotate([ 0, 90, 0])
                cylinder( lr, d, d);

        // linkes Rohr
        translate([ -1, b/2, h/2])
            rotate([ 0, 90, 0])
                cylinder( ll, d, d);
    }

    difference()
    {
        translate([ 0, 0, 0])
        {
            // rechte Verengung
            translate([ ml - 0.75*ml, d, h/2 ])
            {
                rotate([ 35, 90, 0])
                    cylinder(0.75* ml, d/40, d+d/15);

                translate([ ml/2, -d+0.5, 0])
                    rotate([ 0, 90, 0])
                        cylinder(ml, d, d);
            }

            // linke Verengung
            translate([ ml - 0.75*ml, d+1, h/2 ])
            {
                rotate([ -35, 90, 0])
                    cylinder( 0.75*ml, d/40, d+d/15);

                translate([ ml/2, d-0.5, 0])
                    rotate([ 0, 90, 0])
                        cylinder(ml, d, d);

            }
        }

        // Verengungen hinten buendig abschneiden
        translate([ ml, -b/4, -1])
            cube([ ml, b, h+2]);
    }
}

// Die SCHRIFT
translate([ 0, b/2, 0])
{
    translate([ -ml/2, -1.2, h])
        linear_extrude(height=0.8)
            text("Die",4.5,"Folio Xbd BT");

    translate([ ml/2+1.5, -3.2, h])
        linear_extrude(height=0.8)
            text("PARTEI", 6.5,"Folio Xbd BT");
}




