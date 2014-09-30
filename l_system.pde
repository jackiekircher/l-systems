import toxi.geom.*;

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

  camera(0,    0, 1200,  // eyeX, eyeY, eyeZ
         0, -400,    0,  // centerX, centerY, centerZ
         0,    1,    0); // upX, upY, upZ
  arcCam = new ArcBall(0.0, 0.0, 0.0, 1200.0, this);

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
  arcCam.apply();

  // creating a proto segment spawns all of it's iterations
  Vec3D origin    = new Vec3D(0,   0, 0);
  Vec3D direction = new Vec3D(0, -50, 0);
  LSegment proto  = new LSegment(origin, direction,
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
  sA_angleZ = random(0,10);

  sB_angleX = random(0);
  sB_angleY = random(90,90);
  sB_angleZ = random(0);

  sC_angleX = random(-20,20);
  sC_angleY = random(-20,20);
  sC_angleZ = random(-20,20);

  //s_iterations = int(random(8,20));
  currentIteration = 0;
  currentFrame     = 0;
}
