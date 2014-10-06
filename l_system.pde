PFont   font;
ArcBall arcCam;
LSystem system;

boolean recording;
int     growthDelay;
int     currentFrame;
int     currentIteration;

void setup() {
  size(600, 600, P3D);
  smooth();

  camera(300, 300, 525,  // eyeX, eyeY, eyeZ
         300, 300,   0,  // centerX, centerY, centerZ
           0,   1,   0); // upX, upY, upZ
  arcCam = new ArcBall(300, 300, -200, 1000, this);

  font = createFont("Courier",24,true);

  recording        = false;
  growthDelay      = 6;
  currentFrame     = 0;
  currentIteration = 0;

  randomize();
}

void draw() {
  background(0);
  overlayText();

  arcCam.apply();
  system.draw(currentIteration);

  currentFrame++;
  if (currentFrame >= growthDelay &&
      currentIteration < system.iterations) {
    currentIteration++;
    currentFrame = 0;
  }

  if (recording == true) {
    saveFrame("/Users/jackie/code/processing/l_system/image_dump/screen-####.png");
    if (currentIteration >= system.iterations) {
      growthDelay = 6;
      recording   = false;
    }
  }
}

void randomize() {
  system = new LSystem(14);
  system.init();

  currentIteration = 0;
  currentFrame     = 0;
}

