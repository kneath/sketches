import gifAnimation.*;

int step = int(random(0, 600));
float radsPerStep = 0.05;
GifMaker gifExport;

void setup() {
  size(1200, 700);
  smooth();
  
  frameRate(12);

  gifExport = new GifMaker(this, "export.gif");
  gifExport.setRepeat(0);             // make it an "endless" animation
}

void drawOrbit(float diameter, int numStars, float angleOffset, float animationRotation) {
  float e = 0.25;
  
  float orbitWidth = diameter;
  float orbitHeight = ((1 - e)/(1 + e)) * orbitWidth;
  float a = orbitWidth/2;
  float b = orbitHeight/2;
  float cx = width/2;
  float cy = height/2;
  
  for(int i=0; i<numStars; i++) {
    float angleStep = TWO_PI * (float(i)/numStars) + animationRotation;
    int x = int( a * cos(angleStep) );
    int y = int( b * sin(angleStep) );
    float brightness = random(0.2, 0.7) * 255;
    noStroke();
    fill(255, 255, 255, brightness);
    pushMatrix();
    rotate(angleOffset + animationRotation/5);
    ellipseMode(CENTER);
    ellipse(x, y, int(random(1, 3)), int(random(1, 3)));
    popMatrix();
  }
} 

void draw() { 
  background(20, 20, 20);
  translate(width/2, height/2);
  
  int numOrbits = 50;
  int minDiameter = 25;
  int maxDiameter = width - 100;
  float orbitRotation = TWO_PI/0.8;
  float animationRotation = radsPerStep * step;
  
  for(int i=0; i<numOrbits; i++){
    float diameter = minDiameter + (maxDiameter - minDiameter) * (float(i)/numOrbits);
    int numStars = int( random(50, 800) );
    numStars = 100;
    drawOrbit(diameter, numStars, orbitRotation * (float(i)/numOrbits), animationRotation);
  }
  
  step++;
  
  gifExport.setDelay(1);
  gifExport.addFrame();
}

void keyPressed() {
   gifExport.finish(); 
}
