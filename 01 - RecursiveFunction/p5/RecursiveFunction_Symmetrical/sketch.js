/*

Sketch by Markus Lorenz Schilling
hey@malosch.com
http://www.malosch.com

Algorithmic Botany - Adventures Into Programming Botanical Structures Using Processing and P5.js

This sketch is based on Daniel Shiffman's video "Coding Challenge #14: Fractal Trees - Recursive"
https://www.youtube.com/watch?v=0jjeOYMjmDU

*/

var multiplier; // variable to store multiplier, which is used to change the length and thickness of each subsequent branch
var angle; // variable to store current angle

function setup() {
     createCanvas(500,500); // create a canvas of the size 500x500
     slider = createSlider(0,PI, PI/4, 0.01); // add a slider to the page which goes from 0 to TWO_PI, starts at PI/4, and has increments of 0.01
}

function draw() {
     multiplier = 0.67; // set multiplier
     background(42, 157, 143); // set background color
     angle = slider.value(); // read the slider and store it in angle
     stroke(255, 200); // set stroke color and alpha
     translate(width/2,height) // translate to the bottom center of the canvas
     branch(134,21); // call function to draw branch by providing it's length and thickness
}

// branch
function branch(len, thickness) { // brach functions receives value and stores it in len
     strokeWeight(thickness); // set thickness of the lines to be drawn
     line(0,0,0,-len); // draw root of the tree
     translate(0,-len); // translate to the top of the root

     if(len > 4) { // if len is bigger than 4, we are allowed to call branch again
          push(); // save the current transformation matrix
          rotate(angle); // rotate the transformation matrix clockwise
          branch(len * multiplier, thickness * multiplier); // draw new branch with updated parameters
          pop(); // restore previous transformation matrix

          push(); // save  the current transformation matrix
          rotate(-angle); // rotate the transformation matrix counter-clockwise
          branch(len * multiplier, thickness * multiplier); // draw new branch with updated parameters
          pop(); // restore previous transformation matrix
     }
}
