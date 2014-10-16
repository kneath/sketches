size(800, 600, "processing.core.PGraphicsRetina2D");
hint(ENABLE_RETINA_PIXELS);
background(224,228,204);
smooth();

float x, y;
float centerX = width/2;
float centerY = height/2;
float initialRadius = 300;
float innerRadius = 40;
float radius;
float angleStep = 1;

float radiusNoise = 7;

stroke(250,105,0, 30);
strokeWeight(1);

for(float angle = 0; angle < 360*4; angle += noise(radiusNoise) * angleStep) {
  float rad = radians(angle);
  
  radius = initialRadius/4 + (noise(radiusNoise) * initialRadius*3/4);
  radiusNoise += 0.02;
  float xOffset = cos(rad) * radius;
  float yOffset = sin(rad) * radius;

  line(centerX, centerY, centerX + xOffset, centerY + yOffset);
}


noStroke();
fill(224,228,204);
ellipse(centerX, centerY, innerRadius, innerRadius);

save("output.png");
