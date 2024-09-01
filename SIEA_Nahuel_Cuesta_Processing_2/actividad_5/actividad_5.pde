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
  //condicion para que simule el rebote en el eje x
  //teniendo en cuenta el radio del circulo.
  if ((x > width - r) || (x <  + r)) {
    //si se cumple la condicion invertir la direccion
    velocidad_x *= -1;
  }
  y = y + velocidad_y;
  //condicion para que simule el rebote en el eje y
  //teniendo en cuenta el radio del circulo.
  if ((y > height - r) || (y < 0 + r)) {
    //si se cumple la condicion invertir la direccion
    velocidad_y *= -1;
  }

  ellipse(x, y, r * 2, r * 2);
}
