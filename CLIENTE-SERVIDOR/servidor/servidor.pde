import processing.net.*;
Server miServer;
Client client; // Variable para almacenar el cliente conectado
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

  // Verificar si hay un cliente disponible
  if (client == null) { // Solo buscar un nuevo cliente si no hay ninguno almacenado
    Client newClient = miServer.available();
    if (newClient != null) {
      client = newClient; // Almacenar el cliente conectado
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

  textSize(24);
  fill(255, 0, 0);
  text("server", 24, height-10);

  // Enviar la posición del mouse al cliente
  miServer.write(mouseX);
}
