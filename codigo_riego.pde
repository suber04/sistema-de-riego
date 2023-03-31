
int bomba = 2;
int valvula1 = 3;
int valvula2 = 4;


int duracionRiego = 0;
int frecuenciaRiego = 0;
int tiempoActual = 0;
int tiempoAnterior = 0;

void setup() {

  pinMode(bomba, OUTPUT);
  pinMode(valvula1, OUTPUT);
  pinMode(valvula2, OUTPUT);
  

  size(400, 300);
  textSize(20);
  textAlign(CENTER);
}

void draw() {

  background(255);
  fill(0);
  text("Duración de riego (minutos):", width/2, 50);
  text(duracionRiego, width/2, 100);
  text("Frecuencia de riego (minutos):", width/2, 150);
  text(frecuenciaRiego, width/2, 200);
  rect(50, 250, 100, 50);
  text("Encender", 100, 280);
  rect(250, 250, 100, 50);
  text("Apagar", 300, 280);
  

  if (mousePressed && mouseX >= 50 && mouseX <= 150 && mouseY >= 250 && mouseY <= 300) {
    tiempoActual = millis();
    duracionRiego = int(textInput("Duración de riego (minutos):"));
    frecuenciaRiego = int(textInput("Frecuencia de riego (minutos):"));
    digitalWrite(bomba, HIGH);
    delay(1000);
    digitalWrite(valvula1, HIGH);
    delay(1000);
    digitalWrite(valvula2, HIGH);
  }
  

  if (mousePressed && mouseX >= 250 && mouseX <= 350 && mouseY >= 250 && mouseY <= 300) {
    digitalWrite(valvula1, LOW);
    delay(1000);
    digitalWrite(valvula2, LOW);
    delay(1000);
    digitalWrite(bomba, LOW);
  }
  

  if (millis() - tiempoActual >= duracionRiego * 60 * 1000) {
    digitalWrite(valvula1, LOW);
    delay(1000);
    digitalWrite(valvula2, LOW);
    delay(1000);
    tiempoAnterior = millis();
  }
  


