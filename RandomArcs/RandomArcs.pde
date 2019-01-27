import processing.svg.*;

void setup() {
  size(600, 600);
  drawShapes();
}

void draw() {
  // We don’t need anything here, because the keyboard will trigger drawing.
}

void drawShapes() {
  background(0);
  noFill();
  rectMode(CENTER);
  ellipseMode(CENTER);

  for (int i = 1; i < 12; i++) {
    for (int j = 1; j < 12; j++) {
      pushMatrix();
      translate(i * 50, j * 50);
      rotate(random(TAU));
      strokeWeight(1.5);
      stroke(80);
      ellipse(0, 0, 30, 30);
      strokeWeight(3);
      
      int rand = round(random(4));
      switch(rand) {
        case 0:
          stroke(#fc6665);
          break;
        case 1:
          stroke(#9152e1);
          break;
        case 2:
          stroke(#4bbcf6);
          break;
        case 3:
          stroke(#f6e865);
          break;
        case 4:
          stroke(#97e365);
          break;
      }

      arc(0, 0, 30, 30, 0, 0.25 + random(0.5) * TAU);
      popMatrix();
    }
  }
}

void keyReleased() {
  if (key == 32) {
    noiseSeed((long)random(10000));
    drawShapes();
  }
  if (key == 10) {
    beginRecord(SVG, "svg/output-" + nf(frameCount, 6) + ".svg");
    drawShapes();
    endRecord();
  }
}
