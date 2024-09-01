class Circulo {
  PVector ubicacion;
  PVector velocidad;
  int radio;
  int x;
  int y;
  float distancia;
  color c;
  
//cosntructor de Circulo
  Circulo(int x, int y, int vx, int vy, int r, color c) {
    ubicacion = new PVector( x, y);
    velocidad = new PVector(vx, vy);
    radio = r;
    this.c = c;
  }
//metodo para actualizar la posicion de cada circulo en base a la velocidad
  void actualizar() {
    ubicacion = ubicacion.add(velocidad);
  }
//metodo para dibujar 
  void dibujar() {
    fill(c);
    ellipse(ubicacion.x, ubicacion.y, radio*2, radio*2);
  }
//metodo para hallar bordes e invertir la velocidad
  void bordes() {
    if ((ubicacion.x + radio > width ) || (ubicacion.x - radio < 0)) {
      velocidad.x *= -1;
    } 
    if ((ubicacion.y + radio > height ) || (ubicacion.y - radio < 0)) {
      velocidad.y *= -1;
    }
  }
//booleano para detectar cuando se hace click sobre los circulos
  boolean encontrar() {
    distancia = dist(ubicacion.x, ubicacion.y, mouseX, mouseY);
    return distancia < radio; // Retorna verdadero si el mouse está dentro del círculo
  }
}
