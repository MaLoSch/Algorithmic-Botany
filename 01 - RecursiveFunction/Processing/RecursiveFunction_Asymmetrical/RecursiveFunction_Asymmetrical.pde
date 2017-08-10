/*

Sketch by Markus Lorenz Schilling
hey@malosch.com
http://www.malosch.com

Algorithmic Botany - Adventures Into Programming Botanical Structures Using Processing and P5.js

This sketch is based on Daniel Shiffman's video "Coding Challenge #14: Fractal Trees - Recursive"
https://www.youtube.com/watch?v=0jjeOYMjmDU

*/

int limit; // variable to store limit of recursions
float multiplier; // variable to store multiplier, which is used to change the length and thickness of each subsequent branch
float angle; // variable to store current angle
float baseAngle; // variable to store minimum angle between child and parent branch
float minLengthMultiplier; // variable to store minimum length multiplier between child and parent branch
float maxLengthMultiplier; // variable to store maximum length multiplier between child and parent branch
float angleSpread; // variable to store maximum allowed angle spread between child and parent branch

void setup() {
  size(800, 800); // size of the window
  smooth(); // turn anti-aliasing ON
  frameRate(1); // void draw gets executed once every second (1FPS)
}

void draw() {
  limit = 13; // limit of recursions
  angleSpread = 30; // maximum allowed spread of child branch from its parent branch
  baseAngle = radians(5); // minimum angle between child and parent branch
  minLengthMultiplier = 0.55; // minimum length multiplier between child and parent branch
  maxLengthMultiplier = 0.89; // maximum length multiplier between child and parent branch
  drawTree(); // call function to draw a new tree
}

// function to draw a branch
// this will be executed recursively
void drawBranch(float len, float thickness, int counter) { //receives the length of the branch to be drawn
  counter++; // increase counter to keep track of current recursion
  strokeWeight(thickness); // set thickness of the lines to be drawn
  if(counter <= limit - 2) { // set color of branch depending on their position relative to the root position
    stroke(76,46,5,255-(counter*5)); // change alpha value of each subsequent branch
  } else {
    stroke(108,125,71,255-(counter*3)); // change alpha value of each subsequent branch
  }
  line(0, 0, 0, -len); // draw a line from the center of the coordination system along the y-axis
  translate(0, -len); // put the center of the coordination system to the end of the previously drawn branch
  if(counter <= limit) { // this is the exit function. if the recursion counter is bigger than the limit, no new branches are being called
    pushMatrix(); // store current transformation matrix
    angle = baseAngle + radians(random(0,angleSpread));
    rotate(angle); // rotate clockwise
    multiplier = random(minLengthMultiplier,maxLengthMultiplier);
    drawBranch(len * multiplier, thickness * multiplier, counter); // draw new branch with updated parameters
    popMatrix(); // go back to the previous transformation matrix

    pushMatrix(); // store current transformation matrix
    angle = baseAngle + radians(random(0,angleSpread));
    rotate(-angle); // rotate counter clockwise
    multiplier = random(minLengthMultiplier,maxLengthMultiplier);
    drawBranch(len * multiplier, thickness * multiplier, counter); // draw new branch with updated parameters
    popMatrix(); // go back to previous transformation matrix
  }
}

void drawTree() {
  background(175, 190, 143); // set background color
  translate(width/2, height); // put the center of the coordination system to the bottom center of the screen
  drawBranch(134, 21, 0); // call function to draw a branch by providing it's length and thickness
}
