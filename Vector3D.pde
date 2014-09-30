class Vector3D extends PVector {

  public Vector3D(float x, float y, float z) {
    super(x, y, z);
  }

  Vector3D get() {
    return new Vector3D(x, y, z);
  }

  void rotateX(float angle) {
    y = y*cos(angle) - z*sin(angle);
    z = y*sin(angle) + z*cos(angle);
  }

  void rotateY(float angle) {
    x = x*cos(angle) + z*sin(angle);
    z = -x*sin(angle) + z*cos(angle);
  }

  void rotateZ(float angle) {
    x = x*cos(angle) - y*sin(angle);
    y = x*sin(angle) + y*cos(angle);
  }

}
