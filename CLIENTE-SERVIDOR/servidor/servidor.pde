import processing.net.*;
Server miServer;
int r;

void setup() {
  size(500, 500);
  miServer = new Server(this, 4215);
  println("server started on port 4215");
  rectMode(CORNER);
  ellipseMode(CENTER);
  textAlign(LEFT);
  r = 5;
}
void draw() {
  noFill();
  rect(width/3, 90, width/3, height - 110);

  for (int i = 90; i < height-10; i+= 50) {
    line(width/3, i, (width/3)*2, i);

    ellipse(width/3 +r*2, i + r*2, r*2, r*2);
  }

  textSize(24);
  fill(255, 0, 0);
  text("server", 24, height-10);

  // Enviar la posición del mouse al cliente
  miServer.write(mouseX);
}
