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
      rotateDirection(radians(system.aRotation.x),
                      radians(system.aRotation.y),
                      radians(system.aRotation.z));
    }
    if(type == "B") {
      rotateDirection(radians(system.bRotation.x),
                      radians(system.bRotation.y),
                      radians(system.bRotation.z));
    }
    if(type == "C") {
      rotateDirection(radians(system.cRotation.x),
                      radians(system.cRotation.y),
                      radians(system.cRotation.z));
    }
  }

  /* production rules (recursive)
   *
   * determines how each segment mutates across iterations.
   * these rules shouldn't belong to the segment but they
   * are needed here since I don't know how to metaprogram
   * in processing
   */
  void spawn() {

    if(iterations < system.iterations-1) {

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
                                        iterations+1, type);
    system.addSegment(iterations+1, nextSegment);
  }

  void rotateDirection(float angleX, float angleY, float angleZ) {
    direction.rotateX(angleX);
    direction.rotateY(angleY);
    direction.rotateZ(angleZ);
  }
}
