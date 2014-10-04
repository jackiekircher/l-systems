void overlayText() {
  fill(255);

  String aData = new String("A ->"  +
                            "  x: " + nfp(system.aRotation.x,2,2) + "°" +
                            "  y: " + nfp(system.aRotation.y,2,2) + "°" +
                            "  z: " + nfp(system.aRotation.z,2,2) + "°");
  String fData = new String("F ->"  +
                            "  x: " + nfp(system.aRotation.x,2,2) + "°" +
                            "  y: " + nfp(system.aRotation.y,2,2) + "°" +
                            "  z: " + nfp(system.aRotation.z,2,2) + "°");
  String bData = new String("B ->"  +
                            "  x: " + nfp(system.bRotation.x,2,2) + "°" +
                            "  y: " + nfp(system.bRotation.y,2,2) + "°" +
                            "  z: " + nfp(system.bRotation.z,2,2) + "°");
  String cData = new String("C ->"  +
                            "  x: " + nfp(system.cRotation.x,2,2) + "°" +
                            "  y: " + nfp(system.cRotation.y,2,2) + "°" +
                            "  z: " + nfp(system.cRotation.z,2,2) + "°");

  text("rules: (A -> F), (F -> AC+C+C), (C -> CB), (B -> B)", -140, -106);
  text("start: A, angle: (0,120°,0)", -140, -96);

  text("Drawing rules (axis rotation)", -140, 70);
  text(aData, -140,  80, 0);
  text(fData, -140,  90, 0);
  text(bData, -140, 100, 0);
  text(cData, -140, 110, 0);
}

/* user inputs
 *
 * r   -> replay the current system and draw from the beginning
 * c   -> reset the camera to its initial position
 * s   -> save the current frame in the screenshots dir
 * p   -> replay the building of the current system and save each frame
 *        to the image_dump dir
 * ' ' -> randomly create a new system and draw it from stage one
 *
 * mouse press/drag -> send inputs to ArcBall to rotate camera
 */

void keyPressed() {
  if(key == 'r') {
    currentIteration = 0;
  }

  else if(key == 'c') {
    arcCam.reset();
  }

  else if(key == 's') {
    saveFrame("/Users/jackie/code/processing/l_system/screenshots/####.png");
  }

  else if(key == 'p') {
    currentIteration = 0;
    growthDelay      = 0;
    recording        = true;
  }

  else if(key == ' ') {
    randomize();
  }
}

void mousePressed () {
  arcCam.mousePressed(mouseX, mouseY);
}
void mouseDragged () {
  arcCam.mouseDragged(mouseX, mouseY);
}
