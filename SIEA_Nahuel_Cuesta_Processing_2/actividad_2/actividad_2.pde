float velocidad_x = 2;
float velocidad_y = 10;
float x, y;

void setup() {
size(400,300);
x = width;
y = height;
}

void draw() {
background(0);
x = x + velocidad_x;
if (x > width) {
x = 0;
}
y = y + velocidad_y;
if (y > height) {
y = 0;
}
ellipse(x,y,10,10);
}
