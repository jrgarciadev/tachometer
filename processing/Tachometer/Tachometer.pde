
/**
 * Tacometro en RPM, recibe los datos del puerto serial de Arduino UNO
 * el circuito ese basa en el Sensor de efecto Hall
 * @author Junior Garcia <jrgarciadev@gmail.com>
 */
 
PImage bg_gauge, bg_needle;

final static int NEEDLE_CENTER_X = 276;
final static int NEEDLE_CENTER_Y = 8;


void setup() {
  size(640, 452);
  bg_gauge = loadImage("resources/gauge.png");
  bg_needle = loadImage("resources/needle.png");
}

void draw() {
  background(bg_gauge); 
  translate(NEEDLE_CENTER_X, NEEDLE_CENTER_Y);
  //rotate(PI/3.0);
  image(bg_needle, 0, 0);
  //rect(-26, -26, 52, 52);
}
