import processing.svg.*;

void setup() {
  size(600, 600);
  beginRecord(SVG, "svg/output.svg");     // Start recording the SVG before setting the fill and stroke.
  noFill();
  stroke(255);
  noLoop();                               // Only run draw() once.
}

void draw() {
  int numberOfHexes = 20;
  background(0);

  for (int i = 1; i < numberOfHexes; i++) {
    strokeWeight((numberOfHexes - i) * 0.6);
    hexagon(width / 2, height / 2, i * (width / numberOfHexes / 2), i);
  }

  endRecord();
}

void hexagon(float x, float y, float radius, float angle) {
  beginShape();
  for (float a = 0; a < TAU; a += TAU / 6) {
    vertex(x + cos(a + angle) * radius, y + sin(a + angle) * radius);
  }
  endShape(CLOSE);
}
