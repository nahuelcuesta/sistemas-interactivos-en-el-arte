import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput in;
FFT fft;

void setup() {

  size(400, 600);
  rectMode(CENTER);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 256);
  fft = new FFT(in.bufferSize(), in.sampleRate());
}

void draw() {
  background(255);
  fft.forward(in.mix);
  for (int i = 0; i < 256; i ++ ) {

    fill(255, i*10, 0 );
    noStroke();
    ellipse(width / 2, height +i *10, width, fft.getBand(i)*15);
  }
}
void stop() {
  in.close();
  minim.stop();
  super.stop();
}
