
/**
 * Tacometro en RPM, recibe los datos del puerto serial de Arduino UNO
 * el circuito ese basa en el Sensor de efecto Hall
 * @author Junior Garcia <jrgarciadev@gmail.com>
 */
 
PImage bg_gauge, bg_needle;

final static int NEEDLE_CENTER_X = 276;
final static int NEEDLE_CENTER_Y = 8;
int cx, cy;
float circle_diametre;
float speed_radius;
float rot = 0 ;

//Sensor value
int value = 0;

void setup() {
  size(640, 452);
  bg_gauge = loadImage("resources/gauge.png");
  bg_needle = loadImage("resources/needle.png");
 
  int radius = min(width,height) / 2;
  circle_diametre = radius * 1.8;
  speed_radius = radius * 0.8 ;
/* 
 * Divide la altura y anchura de la ventana entre 2, 
 * asegura que el centro del reloj esta en el centro de la ventana
 */
  cx = width / 2 - 10;
  cy = height / 2 - 2;
}

void draw() {
  background(bg_gauge);
  
  value++;
  
  /* Angles for sin() and cos() start at 3 o'clock;
   * subtract HALF_PI to make them start at the top
   */
  float s = map(value, 0, 25, 0, HALF_PI) + 3 * QUARTER_PI ;
 
  
  // Draw the handle
  //stroke(167,20,20);
  //strokeWeight(4);
  //line(cx, cy, cx + cos(s) * speed_radius, cy + sin(s) * speed_radius);
  delay(100);
 
  pushMatrix();
  translate(NEEDLE_CENTER_X + bg_needle.width / 2, NEEDLE_CENTER_Y + bg_needle.height);
  rotate(rot);
  translate(-bg_needle.width / 2, -bg_needle.height);
  image(bg_needle, 0, 0);
  popMatrix();
  rot = rot + 0.05;
  
     
}
