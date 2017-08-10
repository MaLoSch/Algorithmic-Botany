/*

Sketch by Markus Lorenz Schilling
hey@malosch.com
http://www.malosch.com

Algorithmic Botany - Adventures Into Programming Botanical Structures Using Processing and P5.js

This sketch is based on Daniel Shiffman's video "Coding Challenge #14: Fractal Trees - Recursive"
https://www.youtube.com/watch?v=0jjeOYMjmDU

*/

float multiplier; // variable to store multiplier, which is used to change the length and thickness of each subsequent branch
float angle; // variable to store current angle

void setup() {
  size(500, 500); // size of the window
  smooth(); // turn anti-aliasing ON
}

void draw() {
  multiplier = 0.67; // set multiplier
  background(42, 157, 143); // set background color
  stroke(255, 200); // set stroke color and alpha
  translate(width/2, height); // put the center of the coordination system to the bottom center of the screen
  angle = getAngle(mouseX); // calculate current angle based on horiztonal mouse position
  drawBranch(134, 21); // call function to draw a branch by providing it's length and thickness
}

// function to draw a branch
// this will be executed recursively
void drawBranch(float len, float thickness) { //receives the length of the branch to be drawn 
  strokeWeight(thickness); // set thickness of the lines to be drawn
  line(0, 0, 0, -len); // draw a line from the center of the coordination system along the y-axis
  translate(0, -len); // put the center of the coordination system to the end of the previously drawn branch
  if(len > 5) { // if the length of the current branch is bigger than 5, call drawBranch again with new parameters
    pushMatrix(); // store current transformation matrix
    rotate(angle); // rotate clockwise
    drawBranch(len * multiplier, thickness * multiplier); // draw new branch with updated parameters
    popMatrix(); // go back to the previous transformation matrix
    pushMatrix(); // store current transformation matrix
    rotate(-angle); // rotate counter clockwise
    drawBranch(len * multiplier, thickness * multiplier); // draw new branch with updated parameters
    popMatrix(); // go back to previous transformation matrix
  }
}

// function to calculate current angle based on horizontal mouse position
float getAngle(float x) {
  return radians(map(x,0,width,0,180)); // return angle after converting it via radians and using the map function
}