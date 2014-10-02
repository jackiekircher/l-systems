PFont font;

ArcBall arcCam;
ArrayList <LSegment> segments;

// global values for determining drawing rules
float sA_angleX;
float sA_angleY;
float sA_angleZ;

float sB_angleX;
float sB_angleY;
float sB_angleZ;

float sC_angleX;
float sC_angleY;
float sC_angleZ;

int   s_iterations;


int growthDelay;
int currentIteration;
int currentFrame;

void setup() {
  size(1000, 800, P3D);
  smooth();

  camera(0,    0, 1000,  // eyeX, eyeY, eyeZ
         0, -200,    0,  // centerX, centerY, centerZ
         0,    1,    0); // upX, upY, upZ
  arcCam = new ArcBall(0.0, 0.0, 0.0, 1000.0, this);

  font = createFont("Arial",36,true);
  textFont(font);

  segments = new ArrayList <LSegment> ();

  s_iterations     = 14;
  currentIteration = 0;

  currentFrame = 0;
  growthDelay  = 6;

  randomize();
}

void draw() {
  background(0);
  segments.clear();

  overlayText();

  arcCam.apply();

  // creating a proto segment spawns all of it's iterations
  Vector3D origin    = new Vector3D(0,   0, 0);
  Vector3D direction = new Vector3D(0, -50, 0);
  LSegment proto     = new LSegment(origin, direction,
                                    currentIteration, "A");
  segments.add(proto);

  for(LSegment s:segments) {
    s.run();
  }


  currentFrame++;
  if (currentFrame >= growthDelay &&
      currentIteration <= s_iterations) {
    currentIteration++;
    currentFrame = 0;
  }

}

void keyPressed() {
  randomize();
}

void mousePressed () {
  arcCam.mousePressed(mouseX, mouseY);
}
void mouseDragged () {
  arcCam.mouseDragged(mouseX, mouseY);
}

void randomize() {
  sA_angleX = random(0,10);
  sA_angleY = random(0);
  sA_angleZ = random(-10,10);

  sB_angleX = random(-30,30);
  sB_angleY = random(-30,30);
  sB_angleZ = random(-30,30);

  sC_angleX = random(-90,90);
  sC_angleY = random(-90,90);
  sC_angleZ = random(-90,90);

  //s_iterations = int(random(8,20));
  currentIteration = 0;
  currentFrame     = 0;
}

void overlayText() {
  fill(255);

  String aData = String.format("A - rotate x: %3.2f°  rotate y: %3.2f°  rotate z: %3.2f°",
                               sA_angleX, sA_angleY, sA_angleZ);
  String bData = String.format("B - rotate x: %3.2f°  rotate y: %3.2f°  rotate z: %3.2f°",
                               sB_angleX, sB_angleY, sB_angleZ);
  String cData = String.format("C - rotate x: %3.2f°  rotate y: %3.2f°  rotate z: %3.2f°",
                               sC_angleX, sC_angleY, sC_angleZ);

  text(aData, -650, 200);
  text(bData, -650, 250);
  text(cData, -650, 300);
}
