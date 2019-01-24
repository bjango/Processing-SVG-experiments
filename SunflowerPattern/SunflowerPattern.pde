import processing.svg.*;

void setup() {
  size(400, 400);
  beginRecord(SVG, "svg/output.svg");
  noStroke();
  noLoop();
}

void draw() {
  background(#191030);
  float steps = 50;

  for (int i = 0; i < steps; i++) {
    for (int j = 0; j < steps; j++) {
      float angle = j / steps * TAU + (i % 2 * TAU / steps / 2);
      float distance = easeInSin(i / steps) * 180;

      fill(lerpColor(#5ee4ff, #764aed, easeInN(i / steps, 2 + random(10))));
      circle(width / 2 + (cos(angle) * distance),
             height / 2 + (sin(angle) * distance),
             1 + easeInSin(i / steps) * 8);
    }
  }
  endRecord();
}

float easeInSin(float t) {
  return 1 + sin(PI / 2 * t - PI / 2);
}

float easeInN(float t, float power) {
  return pow(t, power);
}
