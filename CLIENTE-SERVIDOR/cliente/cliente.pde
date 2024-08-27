import processing.net.*;
Client miClient;
int x;
int r;

void setup() {
  size(400,400);
  miClient = new Client(this, "192.168.1.38", 4215 );
  r = 5;
}

void draw() {
  background(255,0,0);
  if (miClient.available() > 0) {
    x= miClient.read();
    fill(0,255,0);
    ellipse(width - r*2, height - r*2, r*2,r*2);
  }

  rectMode(CENTER);
  fill(255);
  rect(width/2, height/2, x, 60);
}
