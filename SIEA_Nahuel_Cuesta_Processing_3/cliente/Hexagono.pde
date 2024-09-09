// Definimos la clase Hexagono
class Hexagono {
  float x, y; // Coordenadas del centro del hexágono
  float tamano; // Tamaño del hexágono
  boolean visible; // Indica si el hexágono es visible
  color col;

  Hexagono(float x, float y, float tamanoInicial, color col) {
    this.x = x;
    this.y = y;
    tamano = tamanoInicial;
    this.col = col;
    this.visible = false; // Inicialmente el hexágono no es visible
  }

  // Método para dibujar el hexágono
  void mostrar() {
    if (tamano > width * 2 || !visible) return; // Si el tamaño es mayor que el doble del ancho, deja de dibujarlo
    noStroke();
    fill(col);
    beginShape(); // Comenzar a dibujar la forma
    for (int i = 0; i < 6; i++) {
      float angulo = TWO_PI / 6 * i; //Se dibujan los 6 vertices
      float px = x + cos(angulo) * tamano;
      float py = y + sin(angulo) * tamano;
      vertex(px, py); // Definir los vértices del hexágono
    }
    endShape(CLOSE); // Se termina de dibujar la forma
  }
  // Método para aumentar el tamaño del hexágono
  void crecer() {
    tamano += 5; // Incrementa el tamaño en cada frame
  }
  // Método para hacer visible el hexágono
  void hacerVisible() {
    visible = true;
  }
}
