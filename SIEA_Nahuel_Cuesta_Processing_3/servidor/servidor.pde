import ddf.minim.*;
import ddf.minim.analysis.*;
import processing.net.*;

Minim minim;
AudioPlayer player;
Server server;
Boton botonPlay, botonPause;
boolean playing = false; // Variable para saber si el audio está sonando
float volumen;
PImage img;

void settings() {
  img = loadImage("portada.jpg");
  size(img.width, img.height);
}

void setup() {
  image(img, 0, 0);
  server = new Server(this, 12345);
  minim = new Minim(this);
  botonPlay = new Boton(width/2 - 100, height/2 + 50, 60, color(0, 255, 0));
  botonPause = new Boton(width/2 + 100, height/2 + 50, 60, color(255, 0, 0));
  player = minim.loadFile("la-biblioteca-de-babel.mp3");
  textAlign(CENTER);
  textSize(30);
  frameRate(30);
}

void draw() {
  botonPlay.dibujar();
  fill(0);
  text("Escuchar", width/2 - 100, height/2  + 150);
  botonPause.dibujar();
  fill(0);
  text("Pausar", width/2 + 100, height/2 + 150);
  // Si el audio está sonando, obtener y enviar el valor del volumen
  if (playing && player.isPlaying()) {
    enviarVolumen();
  }
}
// Función para enviar el valor del volumen solo cuando el audio está sonando
void enviarVolumen() {
  float volumen = player.mix.level() * 100; // Obtener el valor de ganancia
  println(int(volumen)); // Mostrar el volumen en la consola
  server.write(int(volumen)); // Enviar el valor del volumen al cliente
}
// Función que detecta clics del mouse
void mouseClicked() {
  if (botonPlay.encontrar()) {
    player.play(); // Reproducir audio
    playing = true; // Cambiar estado a "reproduciendo"
  }
  if (botonPause.encontrar()) {
    player.pause(); // Pausar audio
    playing = false; // Cambiar estado a "pausado"
  }
}
