import processing.net.*;
Server miServer;
Client client; // Variable para almacenar el cliente conectado
int r;
boolean succes;

void setup() {
  size(500, 500);
  miServer = new Server(this, 4215);
  println("server started on port 4215");
  rectMode(CORNER);
  ellipseMode(CENTER);
  r = 5;
  succes = false;
}
void draw() {
  background(255);
  noFill();
  rect(width/3, 90, width/3, height - 110);
  textSize(14);
  strokeWeight(1);
  textAlign(CENTER);
  text("mover mouse de izquierda a derecha modifica ancho de rectangulo en cliente", width/2, 20);

  // Verificar si hay un cliente disponible
  if (client == null) { // Solo buscar un nuevo cliente si no hay ninguno almacenado
    Client newClient = miServer.available();
    if (newClient != null) {
      client = newClient; // Almacenar el cliente conectado
      succes = true; //cambiamos el valor de succes para que muestre el texto
      println("Cliente conectado: " + client.ip()); // Imprimir la IP del cliente

      //variable para almacenar el mensaje enviado desde el lado del cliente
      String message = client.readString();
      if (message != null) {
        println("Mensaje del cliente: " + message);
      }
    }
  } else {
    // Verificar si el cliente sigue activo
    if (!client.active()) {
      println("Cliente desconectado: ");
      client = null; // Restablecer la variable client a null
      succes = false; //succes vuelve a ser falso
    }
  }

  for (int i = 90; i < height-10; i+= 50) {
    line(width/3, i, (width/3)*2, i);

    // Actualizar el color de los elipses basándose en el estado del cliente
    if (client != null) {
      fill(0, 255, 0); // Color verde si hay un cliente conectado
    } else {
      fill(255, 0, 0); // Color rojo si no hay clientes conectados
    }

    ellipse(width/3 +r*2, i + r*2, r*2, r*2);
  }

  if (succes != false) {
    text("cliente conectado", width/2, height-6);
  } else {
    text("cliente no conectado", width/2, height-6);
  }

  textSize(24);
  textAlign(LEFT);
  fill(0);
  text("server", 24, height/2);

  // Enviar la posición del mouse en x al cliente
  miServer.write(mouseX);
}
