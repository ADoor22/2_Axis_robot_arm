  #include <Servo.h>
  Servo baseServo;
  Servo gripperServo;
  Servo armServo;
  
  int serialInArray[3];
  int serialCount = 0;
  boolean firstContact = false;

  void setup() {
    baseServo.attach(9);
    gripperServo.attach(10);
    armServo.attach(11);
    Serial.begin(9600);
    while (!Serial) {
      ; // wait for serial port to connect.
    }
  }

  void loop() {
    
  }

  void serialEvent() {
    if (Serial.available() > 0) {
    // read a byte from the serial port:
    int inByte = Serial.read();
    
    if (firstContact == false) { // waiting for contact
      if (inByte == 'A') {      // Letter A initialises handshake
        Serial.write(0);          // clear the serial port buffer
        firstContact = true;
        Serial.write('A');       // restart handshake
      }
    }
    else {
      // Add the latest byte from the serial port to array:
      serialInArray[serialCount] = inByte;
      serialCount++;

      // Creates an array of length 3, each element is an input for a different axis of rotation.
      if (serialCount > 2 ) {
      baseServo.write(serialInArray[0]); // yaw of arm
      gripperServo.write(serialInArray[1]); // open and close gripper
      armServo.write(serialInArray[2]); // pitch of arm

        // Send a capital A to request start another handshake and get new sensor readings:
        Serial.write('A');
        // Reset serialCount:
        serialCount = 0;
      }
    }
  }
}
