import toxi.geom.*;
import peasy.*;

//import java.awt.Frame;
//import java.awt.BorderLayout;
//import controlP5.*;

PeasyCam cam;
ArrayList <LSegment> segments;

//ControlP5 cP5;
//ControlFrame controlFrame;

int growthDelay;
int currentIteration;
int currentFrame;

void setup() {
  size(800, 800, P3D);
  smooth();
  cam = new PeasyCam(this, 100);
  //ui();

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

  // creating a proto segment spawns all of it's iterations
  Vec3D origin    = new Vec3D( 0, 0, 0);
  Vec3D direction = new Vec3D(50, 0, 0);
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

void randomize() {
  sA_angleX = random(0,10);
  sA_angleY = random(0);
  sA_angleZ = random(0,10);

  sB_angleX = random(-90,90);
  sB_angleY = random(-10,90);
  sB_angleZ = random(-90,90);

  sC_angleX = random(-20,20);
  sC_angleY = random(-20,20);
  sC_angleZ = random(-20,20);

  //s_iterations = int(random(8,20));
  currentIteration = 0;
  currentFrame     = 0;
}
