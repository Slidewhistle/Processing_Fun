import controlP5.*;
ControlP5 cp5;
float factor = 0;
Slider abc;
float r;
int h;
int w;



void setup() {
    size(640, 640);
    h = height/2;
    w = width/2;
    noStroke();
    cp5 = new ControlP5(this);
    cp5.addSlider("factor")
        .setPosition(0,0)
        .setRange(0, 10)
        ;
    r = width/2 - 32;
}   

PVector getVector(float index, float total) {
    float angle = map(index%total, 0, total, 0, TWO_PI);
    PVector v = PVector.fromAngle(angle + PI);    v.mult(r);
    return v;
}

void draw() {
    background(0);
    float total = 200;
    //factor += .01; // comment out this line if you want to use the slider
    stroke(255);
    noFill();
    circle(width/2, height/2, r*2);
    for (int i = 0; i < total; i++) {
        PVector v = getVector(i, total);
        fill(255);
        circle(v.x+w, v.y+h, 16);
    }
    for (int i = 0; i < total; i++) {
        PVector a = getVector(i, total);
        PVector b = getVector(i * factor, total);
        line(a.x+w, a.y+h, b.x+w, b.y+h);
    }
    
}
