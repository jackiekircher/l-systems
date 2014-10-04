void overlayText() {
  fill(255);

  String aData = String.format("A ->  x: %6.2f°  y: %6.2f°  z: %6.2f°",
                               system.aRotation.x, system.aRotation.y, system.aRotation.z);
  String fData = String.format("F ->  x: %6.2f°  y: %6.2f°  z: %6.2f°",
                               system.aRotation.x, system.aRotation.y, system.aRotation.z);
  String bData = String.format("B ->  x: %6.2f°  y: %6.2f°  z: %6.2f°",
                               system.bRotation.x, system.bRotation.y, system.bRotation.z);
  String cData = String.format("C ->  x: %6.2f°  y: %6.2f°  z: %6.2f°",
                               system.cRotation.x, system.cRotation.y, system.cRotation.z);

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
 * r   -> reset the current system and draw from the beginning
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
