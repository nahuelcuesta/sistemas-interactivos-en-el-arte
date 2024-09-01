import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim;
AudioInput in;
PImage imagen;

String poemaEnLadino, poemaEnCastellano;
int centroX, centroY, volumen;
boolean trans;
color blanco, negro, blancoTrans, negroTrans;

void settings() {
  imagen = loadImage("denise.jpg");
  size(imagen.width, imagen.height);
}

void setup() {
  poemaEnLadino = "La piedra minudika\n del silensio.\n La kamaretta de mi madre.\n La llavedura blanka\n ke mira a la kamaretta.\n Los talones de mis pieses\n ke desean\n i no alliegan la ventana.\n El empiezo de todas las kosas.\n La palavra ke quita el miedo\n i una boz\n ke es la manyana.";
  poemaEnCastellano = "La piedra pequeñita\n del silencio.\n La habitación de mi madre.\n La cerradura blanca\n que mira a la habitación.\n Los talones de mis pies\n que desean\n pero no alcanzan la ventana.\n El comienzo de todas las cosas.\n La palabra que quita el miedo\n y una voz\n que es la mañana.";
  centroX = width/2;
  centroY = height/2;
  trans = false;
  blanco = color(255, 255, 255);
  negro = color(0, 0, 0);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 1024);
  textSize(30);
}
void draw() {
  //dibujo la imagen
  image(imagen, 0, 0, width, height);
  filter(THRESHOLD);
  //obtener volumen
  volumen = int(in.mix.level()*100);
  //siempre que el volumen sea mayor a 0 trans sera true.
  trans = volumen > 0;
  textAlign(CENTER);
  //fondo semitransparente
  if (trans) {
    fill(255, 255, 255, 200); // Rojo con 20% de opacidad
  } else {
    fill(0, 0, 0, 220); // Negro con 20% de opacidad
  }
  // rectángulo que cubre toda la pantalla con el color de fondo
  rect(0, 0, width, height);
  //condicion para mostrar textos segun el nivel del volumen
  if (trans != false) {
    fill(negro);
    text(poemaEnLadino, centroX, centroY - 200);
    textAlign(LEFT);
    text("LADINO", 10, 30);
  } else {
    fill(blanco);
    text(poemaEnCastellano, centroX, centroY - 200);
    textAlign(LEFT);
    text("CASTELLANO", 10, 30);
  }
  fill(255, 0, 0); // Color blanco para el texto del autor
  textAlign(CENTER);
  text("Denise León - 'Poemas de Estambul'", centroX, height - 24);
}

void stop() {
  in.close();
  minim.stop();
  super.stop();
}
