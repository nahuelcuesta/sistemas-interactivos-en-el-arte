Circulo circulo;
Circulo circulo2;
int radio;
boolean col;
color amarillo;
color celeste;
color rojo;

void setup() {
  size(500, 500);
  radio = 30;
  col = true;
  amarillo = color (255, 255, 100);
  celeste = color (100, 255, 255);
  rojo = color(255, 100, 100);
  circulo = new Circulo(radio*2, 0, 0, 0, radio, celeste);
  circulo2 = new Circulo(width/2, height/2, int(random(10, 40)), int(random(10, 40)), radio*2, amarillo );
}

void draw() {
  background(255);
  //fill(255,255,100);
  noStroke();
  //actualizo la posicion del cirulo en el eje Y segun la posicion del mouse
  circulo.ubicacion.y = mouseY;
  circulo.dibujar();
  //fill(100,255,255);
  circulo2.dibujar();
  textAlign(CENTER);
  fill(0);
  textSize(20);
  text("clickea los circulos para modificar sus propiedades", width/2, height - radio);
}

//evento para detectar el click en el mouse
void mouseClicked() {
  if (circulo2.encontrar()) {
    //si se hace click dentro del circulo2 se modifican los parametros 
    //del PVctor Ubicacion de circulo y el diametro de circulo 2
    circulo2.ubicacion.x = int(random(radio, width-radio));
    circulo2.ubicacion.y = int(random(radio, height-radio));
    circulo.radio = int(random(10, 40));
    circulo2.actualizar();
    circulo2.bordes();
  }
  //si se hace click dentro de circulo2, este cambia de color  y modifica el diametro de circulo
  if (circulo.encontrar()) {
    col = !col;
    if (col == true) {
      circulo.c = rojo;
    } else {
      circulo.c = celeste;
    }
    circulo2.radio = int(random(10, 40));
  }
}
