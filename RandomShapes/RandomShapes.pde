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
  rectMode(CENTER);
  ellipseMode(CENTER);
  strokeWeight(2);

  for (int i = 1; i < 12; i++) {
    for (int j = 1; j < 12; j++) {
      int rand = round(random(4));
      switch(rand) {
        case 0:
          stroke(#fc6665);
          fill(#fc6665, 150);
          break;
        case 1:
          stroke(#9152e1);
          fill(#9152e1, 150);
          break;
        case 2:
          stroke(#4bbcf6);
          fill(#4bbcf6, 150);
          break;
        case 3:
          stroke(#f6e865);
          fill(#f6e865, 150);
          break;
        case 4:
          stroke(#97e365);
          fill(#97e365, 150);
          break;
      }

      pushMatrix();
      translate(i * 50, j * 50);
      rotate(random(TAU));
      
      rand = round(random(4));
      switch(rand) {
        case 0:
          ellipse(0, 0, 30, 30);
          break;
        case 1:
          polygon(0, 0, 18, 3, 0);
          break;
        case 2:
          polygon(0, 0, 18, 4, 0);
          break;
        case 3:
          polygon(0, 0, 17, 5, 0);
          break;
        case 4:
          polygon(0, 0, 17, 6, 0);
          break;
      }

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

void polygon(float x, float y, float radius, int sides, float angle) {
  beginShape();
  for (float a = 0; a < TAU; a += TAU / sides) {
    vertex(x + cos(a + angle) * radius, y + sin(a + angle) * radius);
  }
  endShape(CLOSE);
}
