class LSystem {

  ArrayList<ArrayList<LSegment>> segments;
  int iterations;

  Rotation3D aRotation;
  Rotation3D bRotation;
  Rotation3D cRotation;

  PVector    origin;
  PVector    direction;

  /* LSystem constructor
   *
   * creates the outline of a new system by initializing
   * an array for each iteration and randomizing rotation
   * rules.
   *
   * TODO: extract the production rules into this class
   */
  LSystem(int _iterations) {

    iterations  = _iterations;

    // initialize an array of empty arrays
    segments    = new ArrayList<ArrayList<LSegment>>();
    for(int i=0; i<iterations; i++) {
      segments.add(new ArrayList<LSegment>());
    }

    origin      = new PVector(300, 500, -200);
    direction   = new PVector(0,   -50,    0);

    aRotation   = new Rotation3D();
    aRotation.x = random(0,10);
    aRotation.y = random(0);
    aRotation.z = random(-10,10);

    bRotation   = new Rotation3D();
    bRotation.x = random(-30,30);
    bRotation.y = random(-30,30);
    bRotation.z = random(-30,30);

    cRotation   = new Rotation3D();
    cRotation.x = random(-90,90);
    cRotation.y = random(-90,90);
    cRotation.z = random(-90,90);
  }

  /* initialize the system
   *
   * this has to happen in a separate step because the
   * LSegment class needs to call on properties of an already
   * existant system
   */
  void init() {
    // create a proto segment spawns all of it's iterations
    LSegment proto = new LSegment(origin, direction, 0, "A");
    addSegment(0, proto);
  }

  void addSegment(int i, LSegment segment) {
    segments.get(i).add(segment);
  }

  void draw(int n) {
    for(int i=0; i < n; i++){
      for(LSegment s : segments.get(i)) {
        s.display();
      }
    }
  }

}

class Rotation3D {
  public float x;
  public float y;
  public float z;
}
