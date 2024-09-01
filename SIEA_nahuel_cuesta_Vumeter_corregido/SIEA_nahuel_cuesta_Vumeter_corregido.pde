import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput in;
FFT fft;

void setup() {

  size(500, 552);
  ellipseMode(CENTER);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 512);
  fft = new FFT(in.bufferSize(), in.sampleRate());
}

void draw() {
  background(0);
  fft.forward(in.mix);
  println(fft.specSize());
  for (int i = 0; i < fft.specSize() - 1; i ++ ) {
    if (i%2==0) {
      fill(i*10, 255, 0 );
      noStroke();
      ellipse(width/2, (height - 20) - i *2, fft.getBand(i)*10, 40);
    } else {
      fill(255, i*10, 255  );
      stroke(i);
      ellipse(width/2 -2, (height - 20) - i *2, fft.getBand(i)*10, 40);
    }
  }

  //numeros referencia de valores de frecuencias audibles para el oido humano
  //utilizando la funcion map para mapear 0 a 20000 entre 0 a height 
  //y mostrar numeros cada 500 hz
  for (int i = 0; i <= 20000; i += 500) {
  int y = int(map(i, 0, 20000, height, 0));
  text(i + " hz", 10, y);
}
}
void stop() {
  in.close();
  minim.stop();
  super.stop();
}
