
/**
 * Tacometro en RPM, recibe los datos del puerto serial de Arduino UNO
 * el circuito ese basa en el Sensor de efecto Hall
 * @author Junior Garcia <jrgarciadev@gmail.com>
 */
 
PImage bg_gauge, bg_needle;

final static float NEEDLE_CENTER_X = 276;
final static float NEEDLE_CENTER_Y = 8;

//Sensor value
float value = 0;

void setup() {
  size(640, 452);
  bg_gauge = loadImage("resources/gauge.png");
  bg_needle = loadImage("resources/needle.png");
}

void draw() {
  background(bg_gauge);
  pushMatrix();
  translate(NEEDLE_CENTER_X + bg_needle.width / 2, NEEDLE_CENTER_Y + bg_needle.height * 0.89);
  rotate(value);
  translate(-bg_needle.width / 2, -bg_needle.height * 0.89);
  image(bg_needle, 0, 0);
  popMatrix();
  value = value + 0.01;
}
