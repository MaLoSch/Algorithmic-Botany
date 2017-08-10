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
var limit = 0; // variable to store limit of recursion
var baseAngle = 0; // variable to store minimum angle between child and parent branch
var minLengthMultiplier = 0; // variable to store minimum length multiplier
var maxLengthMultiplier = 0; // variable to store maximum length multiplier
var angleSpread = 0; // variable to store maximum allowed angle spread between child and parent branch

function setup() {
     createCanvas(500,500); // create a canvas of the size 500x500

     createP("Angle Spread");
     sliderAngleSpread = createSlider(0,45,30,1); // add a slider to the page which goes from 0 to 45 degrees. it is used to set the random spread between child and parent branch
     angleSpreadVal = createElement('p','');

     createP("Base Angle");
     sliderBaseAngle = createSlider(0,PI/4,radians(5),0.01); // add a slider to the page which goes from 0 to 45 degrees. it is used to set the base angle between child and parent branch
     createP("minLengthMultiplier");
     sliderMinLengthMultiplier = createSlider(0,1,0.55,0.01);
     createP("maxLengthMultiplier");
     sliderMaxLengthMultiplier = createSlider(0,1,0.89,0.01);
     createP("Recursions");
     sliderRecursions = createSlider(1,13,8,1);
     buttonRefresh = createButton("Refresh");

     sliderAngleSpread.mouseReleased(drawTree);
     sliderBaseAngle.mouseReleased(drawTree);
     sliderMinLengthMultiplier.mouseReleased(drawTree);
     sliderMaxLengthMultiplier.mouseReleased(drawTree);
     sliderRecursions.mouseReleased(drawTree);
     buttonRefresh.mousePressed(drawTree);

     drawTree();
}

function draw() {
     // nothing
}

// function to draw a tree
function drawTree() {
     angleSpread = sliderAngleSpread.value();
     angleSpreadVal.html(angleSpread);
     baseAngle = sliderBaseAngle.value();
     minLengthMultiplier = sliderMinLengthMultiplier.value();
     maxLengthMultiplier = sliderMaxLengthMultiplier.value();
     limit = sliderRecursions.value();
     background(175, 190, 143); // set background color
     translate(width/2,height) // translate to the bottom center of the canvas
     branch(89,13,0); // call function to draw branch by providing it's length and thickness
}

// branch
function branch(len, thickness, counter) { // brach functions receives value and stores it in len
     counter++; // increase the counter to keep track of the number of recursions
     strokeWeight(thickness); // set thickness of the lines to be drawn
     if(counter <= limit -2) { // set color of branch depending on their position relative to the root
          stroke(76,46,5,255-(counter*5)); // change alpha value of each subsequent branch
     } else {
          stroke(108,125,71,255-(counter*3)); // change alpha value of each subsequent branch
     }
     line(0,0,0,-len); // draw root of the tree
     translate(0,-len); // translate to the top of the root

     if(counter <= limit) { // This is the exit function. If the recursion counter is bigger than the limit, no new branches are being drawn
          push(); // save the current transformation matrix
          angle = baseAngle + radians(random(0,angleSpread));
          rotate(angle); // rotate the transformation matrix clockwise
          multiplier = random(minLengthMultiplier, maxLengthMultiplier);
          branch(len * multiplier, thickness * multiplier, counter); // draw new branch with updated parameters
          pop(); // restore previous transformation matrix

          push(); // save  the current transformation matrix
          angle = baseAngle + radians(random(0,angleSpread));
          rotate(-angle); // rotate the transformation matrix counter-clockwise
          multiplier = random(minLengthMultiplier, maxLengthMultiplier);
          branch(len * multiplier, thickness * multiplier, counter); // draw new branch with updated parameters
          pop(); // restore previous transformation matrix
     }
}
