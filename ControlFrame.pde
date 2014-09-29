/*
// the ControlFrame class extends PApplet, so we
// are creating a new processing applet inside a
// new frame with a controlP5 object loaded
public class ControlFrame extends PApplet {

  int w, h;

  ControlP5 cp5;
  Object parent;

  public void setup() {
    size(w, h);
    frameRate(25);
    cp5 = new ControlP5(this);

    //cp5.addSlider("bg").plugTo(parent,"bg").setRange(0, 255).setPosition(10,10);

    cp5.addSlider("A angleX").plugTo(parent,"sA_angleX").
      setRange(-90,90).setPosition(10,10).setSize(150,10).setValue(0);
    cp5.addSlider("A angleY").plugTo(parent,"sA_angleY").
      setRange(-90,90).setPosition(10,30).setSize(150,10).setValue(0);
    cp5.addSlider("A angleZ").plugTo(parent,"sA_angleZ").
      setRange(-90,90).setPosition(10,50).setSize(150,10).setValue(5);

    cp5.addSlider("B angleX").plugTo(parent,"sB_angleX").
      setRange(-90,90).setPosition(10,90).setSize(150,10).setValue(0);
    cp5.addSlider("B angleY").plugTo(parent,"sB_angleY").
      setRange(-90,90).setPosition(10,110).setSize(150,10).setValue(90);
    cp5.addSlider("B angleZ").plugTo(parent,"sB_angleZ").
      setRange(-90,90).setPosition(10,130).setSize(150,10).setValue(0);

    cp5.addSlider("C angleX").plugTo(parent,"sC_angleX").
      setRange(-90,90).setPosition(10,170).setSize(150,10).setValue(-11);
    cp5.addSlider("C angleY").plugTo(parent,"sC_angleY").
      setRange(-90,90).setPosition(10,190).setSize(150,10).setValue(0);
    cp5.addSlider("C angleZ").plugTo(parent,"sC_angleZ").
      setRange(-90,90).setPosition(10,210).setSize(150,10).setValue(0);

    cp5.addSlider("iterations").plugTo(parent,"s_iterations").
      setRange(0,24).setPosition(10, 250).setSize(150,10).setValue(14);
  }

  public void draw() {
    background(100);
  }

  private ControlFrame() {
  }

  public ControlFrame(Object theParent, int theWidth, int theHeight) {
    parent = theParent;
    w      = theWidth;
    h      = theHeight;
  }

  public ControlP5 control() {
    return cp5;
  }

}

ControlFrame addControlFrame(String theName, int theWidth, int theHeight) {
  Frame f = new Frame(theName);
  ControlFrame p = new ControlFrame(this, theWidth, theHeight);
  f.add(p);
  p.init();
  f.setTitle(theName);
  f.setSize(p.w, p.h);
  f.setLocation(100, 100);
  f.setResizable(false);
  f.setVisible(true);
  return p;
}
*/
