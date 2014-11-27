void setup() {
  size(800, 600);
  smooth();
  
  int layers = 5;
  
  color darkGrey = color(#252525);
  color blue = color(52,112,191);
  color lightBlue = color(68,175,242);
  color green = color(186,191,27);
  color yellow = color(238,242,109);
  color red = color(166,33,3);
  
  color[] colors = { blue, lightBlue, green, yellow, red };
  
  background(darkGrey);
  
  noFill();
  strokeWeight(15);
  strokeCap(ROUND);
  
  for (int layerIndex = 0; layerIndex < layers; layerIndex++) {
    int startDistance = 100;
    int endDistance = 500;
    int boxSize = startDistance + (endDistance - startDistance) * layerIndex / layers;
    int steps = int(random(7, 30));
    
    
    for (int i=0; i < steps; i++) {
      if (random(10) < 2) { continue; }
      
      
      int colorIndex = int(random(colors.length));
      stroke(colors[colorIndex]);
      arc(width/2, height/2, boxSize, boxSize, i*2*PI/steps, (i + 1)*2*PI/steps);
    }
    
  }

}

void draw() { }

void keyPressed() {
  save(random(23232)+".jpg");
}
