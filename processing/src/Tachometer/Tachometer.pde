
/**
 * Tacometro en RPM, recibe los datos del puerto serial de Arduino UNO
 * el circuito ese basa en el Sensor de efecto Hall
 * @author Junior Garcia <jrgarciadev@gmail.com>
 */
 
PImage bg;
int y;

void setup() {
  size(640, 452);
  bg = loadImage("../resources/gauge.png");
}

void draw() {
  background(bg);
  
  stroke(226, 204, 0);
  line(0, y, width, y);
  
  y++;
  if (y > height) {
    y = 0; 
  }
}
