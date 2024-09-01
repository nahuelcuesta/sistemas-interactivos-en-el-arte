float velocidad_x = 2;
float velocidad_y = 2;
float x, y, r;

void setup() {
  size(400, 300);
  x = random(0, width);
  y = random(0, height);
  r = 5;
}

void draw() {
  background(0);
  x = x + velocidad_x;
  //condicion para que simule el rebote del circulo
  //teniendo en cuenta el radio del mismo y
  //el margen derecho
  if (x > width - r) {
    velocidad_x *= -1;
  }
  y = y + velocidad_y;
  if (y > height) {
    y = 0;
  }

  ellipse(x, y, r * 2, r * 2);
}
