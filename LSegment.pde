class LSegment {

  Vec3D  location;
  Vec3D  origin;
  Vec3D  direction;
  int    iterations;
  String type;

  LSegment(Vec3D _origin,     Vec3D  _direction,
           int   _iterations, String _type) {

    origin     = _origin;
    location   = _origin.copy();
    direction  = _direction;
    iterations = _iterations;
    type       = _type;

    updateLocation();
    updateDirection();
    spawn();
  }

  void updateLocation() {
    location.addSelf(direction);
  }

  // determines the graphical meaning of the segment
  // (rotation, length, color, etc)
  void updateDirection() {
    if(type == "A") {
      float angleX = radians(sA_angleX);
      float angleY = radians(sA_angleY);
      float angleZ = radians(sA_angleZ);

      rotateDirection(angleX, angleY, angleZ);
    }
    if(type == "B") {
      float angleX = radians(sB_angleX);
      float angleY = radians(sB_angleY);
      float angleZ = radians(sB_angleZ);

      rotateDirection(angleX, angleY, angleZ);
    }
    if(type == "C") {
      float angleX = radians(sC_angleX);
      float angleY = radians(sC_angleY);
      float angleZ = radians(sC_angleZ);

      rotateDirection(angleX, angleY, angleZ);
    }
  }

  // production rules
  // determines how each segment mutates across iterations
  // (recursive)
  void spawn() {

    if(iterations > 0) {

      if(type == "A") {
        createNextIteration("A");
        createNextIteration("C");
      }

      if(type == "B") {
        createNextIteration("A");
      }

      if(type == "C") {
        createNextIteration("B");
        createNextIteration("B");
      }
    }
  }

  void run() {
    display();
  }

  void display() {
    int vRed   = int(iterations*20);
    int vGreen = 255;
    int vBlue  = 255;

    /*
    stroke(vRed,vGreen,vBlue);
    strokeWeight(4);
    point(origin.x, origin.y, origin.z);
    */

    stroke(vRed,vGreen,vBlue);
    strokeWeight(2);
    line(origin.x,   origin.y,   origin.z,
         location.x, location.y, location.z);
  }

  void createNextIteration(String type) {
    LSegment nextSegment = new LSegment(location.copy(), direction.copy(),
                                        iterations-1, type);
    segments.add(nextSegment);
  }

  void rotateDirection(float angleX, float angleY, float angleZ) {
    direction.rotateX(angleX);
    direction.rotateY(angleY);
    direction.rotateZ(angleZ);
  }
}
