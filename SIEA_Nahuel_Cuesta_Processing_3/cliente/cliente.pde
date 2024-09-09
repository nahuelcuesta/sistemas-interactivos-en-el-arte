import processing.net.*;
ArrayList<Hexagono> hexagonos; // ArrayList para almacenar todos los hexágonos
float rand;
Client client;
int x;

void setup() {
  size(800, 800);
  client = new Client(this, "127.0.0.1", 12345);
  rand = random(1, 10);
  hexagonos = new ArrayList<Hexagono>(); // Inicializar el ArrayList
  frameRate(30);
}

void draw() {
  background(255);
  // Dibujar y hacer crecer todos los hexágonos
  for (Hexagono hex : hexagonos) {
    hex.mostrar(); // Dibujar cada hexágono
    hex.crecer();  // Aumentar el tamaño de cada hexágono
  }
  if (client.available() > 0) {
    x= client.read();
    if ((x > 10) ) {
      Hexagono nuevoHexagono = new Hexagono(width/2, height/2, rand, color (random(0, 255))); //instanciar el hexagono
      nuevoHexagono.hacerVisible(); // hacerlo visible inmediatamente
      hexagonos.add(nuevoHexagono); // Añadir el nuevo hexágono al ArrayList
    }
    println(x);
  }
}
