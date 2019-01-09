/**
 * Tacometro en RPM, envia los datos del puerto serial de Arduino UNO
 * el circuito ese basa en el Sensor de efecto Hall a un entorno grafico
 * creado en processing
 * @author Junior Garcia <jrgarciadev@gmail.com>
 */

int led_pin = 13;                       
int sensor_pin = A0;
int sensor_value = 0;

void setup() {
  pinMode(led_pin, OUTPUT);             
  Serial.begin(9600);                    
}

void loop() {
  sensor_value = analogRead(sensor_pin);
  Serial.write(map(sensor_value, 0, 1020, 0, 255));                     
  delay(30);
  /*
  if (digitalRead(switchPin) == HIGH) { 
    Serial.write(1);                     
  } else {                               
    Serial.write(0);               
  }*/
}
