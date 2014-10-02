class LSegment {

  Vector3D  location;
  Vector3D  origin;
  Vector3D  direction;
  int       iterations;
  String    type;

  LSegment(Vector3D _origin,  Vector3D  _direction,
           int  _iterations,  String _type) {

    origin     = _origin;
    location   = _origin.get();
    direction  = _direction;
    iterations = _iterations;
    type       = _type;

    updateLocation();
    updateDirection();
    spawn();
  }

  void updateLocation() {
    location.add(direction);
  }

  // determines the graphical meaning of the segment
  // (rotation, length, color, etc)
  void updateDirection() {
    if(type == "A" || type =="F") {
      rotateDirection(radians(sA_angleX),
                      radians(sA_angleY),
                      radians(sA_angleZ));
    }
    if(type == "B") {
      rotateDirection(radians(sB_angleX),
                      radians(sB_angleY),
                      radians(sB_angleZ));
    }
    if(type == "C") {
      rotateDirection(radians(sC_angleX),
                      radians(sC_angleY),
                      radians(sC_angleZ));
    }
  }

  // production rules
  // determines how each segment mutates across iterations
  // (recursive)
  void spawn() {

    if(iterations > 0) {

      if(type == "A") {
        createNextIteration("F");
      }

      if(type == "F") {
        createNextIteration("A");
        createNextIteration("C");
        direction.rotateY(radians(120));
        createNextIteration("C");
        direction.rotateY(radians(120));
        createNextIteration("C");
      }

      if(type == "C") {
        createNextIteration("C");
        createNextIteration("B");
      }

      if(type == "B") {
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
    LSegment nextSegment = new LSegment(location.get(), direction.get(),
                                        iterations-1, type);
    segments.add(nextSegment);
  }

  void rotateDirection(float angleX, float angleY, float angleZ) {
    direction.rotateX(angleX);
    direction.rotateY(angleY);
    direction.rotateZ(angleZ);
  }
}
