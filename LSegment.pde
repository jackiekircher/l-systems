class LSegment {

  PVector location;
  PVector origin;
  PVector direction;
  int     iteration;
  String  type;

  LSegment(PVector _origin, PVector _direction,
           int _iteration,  String  _type) {

    origin    = _origin;
    location  = _origin.get();
    direction = _direction;
    iteration = _iteration;
    type      = _type;

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
      rotateDirection(system.aRotation.x,
                      system.aRotation.y,
                      system.aRotation.z);
    }
    if(type == "B") {
      rotateDirection(system.bRotation.x,
                      system.bRotation.y,
                      system.bRotation.z);
    }
    if(type == "C") {
      rotateDirection(system.cRotation.x,
                      system.cRotation.y,
                      system.cRotation.z);
    }
  }

  /* production rules (recursive)
   *
   * determines how each segment mutates across iteration.
   * these rules shouldn't belong to the segment but they
   * are needed here since I don't know how to metaprogram
   * in processing
   */
  void spawn() {

    if(iteration < system.iterations-1) {

      if(type == "A") {
        createNextIteration("F");
      }

      if(type == "F") {
        createNextIteration("A");
        createNextIteration("C");
        rotateDirection(0,120,0);
        createNextIteration("C");
        rotateDirection(0,120,0);
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
    int vRed   = (system.iterations - iteration)*
                 int(255/system.iterations);
    int vGreen = 255;
    int vBlue  = 255;

    stroke(vRed,vGreen,vBlue);
    strokeWeight(2);
    line(origin.x,   origin.y,   origin.z,
         location.x, location.y, location.z);
  }

  private void createNextIteration(String type) {
    LSegment nextSegment = new LSegment(location.get(), direction.get(),
                                        iteration+1, type);
    system.addSegment(iteration+1, nextSegment);
  }

  private void rotateDirection(float x, float y, float z) {
    sRotateX(direction, radians(x));
    sRotateY(direction, radians(y));
    sRotateZ(direction, radians(z));
  }

  private void sRotateX(PVector vector, float angle) {
    vector.y = vector.y*cos(angle) - vector.z*sin(angle);
    vector.z = vector.y*sin(angle) + vector.z*cos(angle);
  }
  private void sRotateY(PVector vector, float angle) {
    vector.x = vector.x*cos(angle) + vector.z*sin(angle);
    vector.z = -vector.x*sin(angle) + vector.z*cos(angle);
  }
  private void sRotateZ(PVector vector, float angle) {
    vector.x = vector.x*cos(angle) - vector.y*sin(angle);
    vector.y = vector.x*sin(angle) + vector.y*cos(angle);
  }
}
