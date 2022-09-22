import processing.serial.*;
import de.voidplus.leapmotion.*;
LeapMotion leap;
Serial myPort; 
int inByte = 0;
int gripper;
int base;
int arm;

void setup() {
  size(1600, 1000);
  background(255);
  leap = new LeapMotion(this);  
  println(Serial.list());  
  myPort = new Serial(this,"COM5", 9600); //sets the serial port and BAUD rate
  establishContact();
} 
void draw() { 
  background(255);
  int fps = leap.getFrameRate();
  //System.out.println(fps);
  for (Hand hand : leap.getHands ()) {
    // ==================================================
    // 2. Hand

    int     handId             = hand.getId();
    PVector handPosition       = hand.getPosition();
    PVector handStabilized     = hand.getStabilizedPosition();
    PVector handDirection      = hand.getDirection();
    PVector handDynamics       = hand.getDynamics();
    float   handRoll           = hand.getRoll();
    float   handPitch          = hand.getPitch();
    float   handYaw            = hand.getYaw();
    boolean handIsLeft         = hand.isLeft();
    boolean handIsRight        = hand.isRight();
    float   handGrab           = hand.getGrabStrength();
    float   handPinch          = hand.getPinchStrength();
    float   handTime           = hand.getTimeVisible();
    PVector spherePosition     = hand.getSpherePosition();
    float   sphereRadius       = hand.getSphereRadius();

    hand.draw();
    // --------------------------------------------------
    
    base = (int)map(handYaw,-120,150,180,0);
    //gripper = (int)map(handPinch,0,1,90,180);
    if(handPinch > 0.7) { 
        gripper = 180;
    }
    else {
        gripper = 90;
    }
    arm = (int)map(handPosition.y,-700,1000,180,0);
    
if (myPort.available() > 0) {
    // get incoming byte:
    inByte = myPort.read();
    //System.out.println(inByte);
    
      
  
    
      myPort.write(base);
      //System.out.println(base);

      myPort.write(gripper);
      //System.out.println(handYaw);
 
      myPort.write(arm);
      //System.out.println(arm);
      
      //myPort.write(255);
      //System.out.println(255);
  
  
}

}
}
void establishContact() {
  while (myPort.available() <= 0) {
    myPort.write(65); // send a capital A
    System.out.println("'A' sent");
    delay(300);
  }
}
