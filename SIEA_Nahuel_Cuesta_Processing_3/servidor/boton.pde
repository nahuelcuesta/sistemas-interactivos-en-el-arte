class Boton {
  float x, y, radio, distancia;
  color col;


  Boton(float x, float y, float radio, color col) {

    this.x = x;
    this.y = y;
    this.radio = radio;
    this.col = col;
  }

  void dibujar() {
    fill(col);
    ellipse(x, y, radio * 2, radio * 2);
  }

  // Método para verificar si el mouse está sobre el botón
  boolean encontrar() {
    distancia = dist(mouseX, mouseY, x, y);

    return distancia <= radio; // Devuelve true si el mouse está dentro del botón
  }
}
