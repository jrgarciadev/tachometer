import processing.serial.*; //Import Serial library
 
Serial port; //Serial port name 

PrintWriter output;  //Text file for writing sensor data
int cx, cy;
float circleDiametre;
float speedRadius;

int valor = 0;//Sensor value
String speed;

void setup() {
  size(640, 360);
  stroke(255);
  
  int radius = min(width,height) / 2;
  circleDiametre = radius * 1.8;
  speedRadius = radius * 0.8 ;
  cx = width / 2;
  cy = height / 2;// divide la altura y anchura de la ventana entre 2, asegura que el centro del reloj esta en el centro de la ventana
  
  //println(Serial.list()); //Serail port list
  //port = new Serial(this, Serial.list()[0], 9600); //Open first serial port from USB
   
  //output = createWriter("speed_data.txt"); //Create Text file . By default in same sketch folder
   
}

void draw() {
  background(20);
  valor++;
  //Getting data sensor from Arduino
  //if(port.available() > 0) // si hay algún dato disponible en el puerto
  // {
  //   speed = port.readString();
  //   valor = Integer.parseInt(trim(speed));
  //   println(speed);
  // }
  //Data visualization
   text(valor,0.8 * width,height/2);
   text("km/h", 0.8 * width,(height + 50 )/2);
 
    
   //Writing data in the text file
   //output.print(valor + "km/h");
   //output.println("");
  
  fill(55);
  noStroke();
  ellipse(cx,cy,circleDiametre,circleDiametre);//draw the speedometer background
  
  
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(valor, 0, 25, 0, HALF_PI) + 3 * QUARTER_PI ;
 
  
   // Draw the handle
  stroke(167,20,20);
  strokeWeight(4);
  line(cx, cy, cx + cos(s) * speedRadius, cy + sin(s) * speedRadius);
  
  //delay(100);
   // Draw the speed ticks
  stroke(255);
  strokeWeight(8);
  beginShape(POINTS);
  for (int a = 135; a < 410; a+=20) {
    float angle = radians(a);
    float x = cx + cos(angle) * speedRadius;
    float y = cy + sin(angle) * speedRadius;
    vertex(x, y);
  }
  
}
