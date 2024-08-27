import processing.net.*;
Client Client;
int x;
int r;

void setup() {
  size(400, 400);
  Client = new Client(this, "127.0.0.1", 4215 );
  Client.write("cliente conectado"); // Enviar un mensaje de prueba al servidor
  r = 5;
}

void draw() {
  background(255, 0, 0);
  if (Client.available() > 0) {
    x= Client.read();
    fill(0, 255, 0);
    ellipse(width - r*2, height - r*2, r*2, r*2);
  }
  rectMode(CENTER);
  fill(255);
  rect(width/2, height/2, x, 60);
}
