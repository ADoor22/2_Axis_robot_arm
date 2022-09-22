# 2_Axis_robot_arm

This project was adapted from a coursework project which consisted of building a primitive arm out of popsicle sticks. Using servo motors connected to an arduino, we programmed to control the arm by using analogue potentiometers.

I took this project a step further on my own terms, using a leap motion controller as the input instead of the two potentiometers. This lead me into implementing my own serial communication protocol to be able to send multiple variables of data, such as hand height and orientation, to the arm at once. With this I managed to control the robotic servo motor arm with my hand movements.

I have plans on 3D printing a 3-axis robot arm and adapting this code to work.

**Controls**
 - To control the **Yaw** of the arm, rotate your hand clockwise/anticlockwise over the leapmotion with you palm facing down.
 - To control the **Pitch** of the arm, increase/decrease the pitch of your hand over the leapmotion.
 - To **open/close** the grabber on the arm, form a "pinching" motion with your thumb and index finger and pinch to close the grabber.
