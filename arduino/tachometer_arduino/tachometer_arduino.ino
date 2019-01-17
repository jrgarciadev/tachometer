/**
 * Tacometro en RPM, envia los datos del puerto serial de Arduino UNO
 * el circuito ese basa en el Sensor de efecto Hall a un entorno grafico
 * creado en processing
 * @author Junior Garcia <jrgarciadev@gmail.com>
 */

volatile int count = 0;

void setup() {
  Serial.begin(57600);
  attachInterrupt(0, interruption_0, RISING);                 
}

void loop() {
  delay(200);
  //Serial.println(map(count, 0, 1020, 0, 255));   
  Serial.println(count * 20);   
  count = 0;
}

void interruption_0(){
  count++;
}

