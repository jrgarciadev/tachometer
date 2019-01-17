 //<>//
/**
 * Tacometro en RPM, recibe los datos del puerto serial de Arduino UNO
 * el circuito ese basa en el Sensor de efecto Hall
 * @author Junior Garcia <jrgarciadev@gmail.com>
 */
import processing.serial.*;
PImage rpm_img, needle_img;


final static float NEEDLE_CENTER_X = 276;
final static float NEEDLE_CENTER_Y = 8;
float needle_trsn_x;
float needle_trsn_y; 
float needle_x;
float needle_y;
//Sensor value
float min_value = -2.09;
float max_value = 2.6;
String message = "";
float value = 0;
int pre_value = 0;
Serial myPort;  // Create object from Serial class

void setup() {
  size(640, 452);
  rpm_img = loadImage("resources/rpm.png");
  needle_img = loadImage("resources/needle.png");
  needle_x = needle_img.width / 2;
  needle_y = needle_img.height * 0.89;
  needle_trsn_x = NEEDLE_CENTER_X + needle_x;
  needle_trsn_y = NEEDLE_CENTER_Y + needle_y;
  value = min_value;
  // for Linux
  //String portName = "/dev/ttyUSB0";

  // for Windows
  /*String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 57600);*/
}

void draw() {
    background(rpm_img);
    text("RPM: " + pre_value, 500, 440);
    translate(needle_trsn_x, needle_trsn_y );
    rotate(value);
    translate(-needle_x, -needle_y);
    image(needle_img, 0, 0);
    /*
  if ( myPort.available() > 0) {
    message = myPort.readStringUntil(13);
    if (message!=null) {
      pre_value = int(float(message));
      println("RPM: " + pre_value);
      value = map_float(pre_value, 0, 3000, min_value, max_value );
    } else {
      //value = min_value;
    }
  }
  */
}


float map_float(int val, int in_min, int in_max, float out_min, float out_max) {
  return (val - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}