import processing.svg.*;

void setup() {
  size(250, 250);                        // Set up a 250×250 canvas.
  beginRecord(SVG, "svg/output.svg");    // Start recording drawing operations to this file.
  noLoop();                              // Only run draw() once.
}

void draw() {
  noStroke();                            // Turn off the border on objects we’re about to draw.
  fill(#4bbcf6);                         // Set the fill colour to light blue.
  rect(50, 50, 100, 100);                // Draw a rectangle on the canvas and to the SVG file.
  fill(#5721a5);                         // Set the fill colour to purple.
  ellipse(150, 150, 100, 100);           // Draw a circle on the canvas and to the SVG file.
  endRecord();                           // Save and close the SVG file recording.
}
