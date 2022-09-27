import peasy.*;
import controlP5.*;  
import processing.opengl.*;
PeasyCam cam;
Game game;
final int yokoL = 9;
final int tateL = 9;
int browseHand;

void setup() {
  frameRate(30);
  size(1200, 800, OPENGL);
  setCam();
  game = new Game();
  setupGui();
  browseHand = Math.round(handSlider.getValue());
}

void draw() {
  if(keyPressed == false) browseHand = Math.round(handSlider.getValue());
  background(0);
  lights();
  hint(ENABLE_DEPTH_SORT);
  game.draw3D();
  hint(DISABLE_DEPTH_SORT);
  cam.beginHUD();
    game.draw2D();
  cam.endHUD();
  drawGui(true);
}

void setCam() {
  cam = new PeasyCam(this, 2000);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(2000);
}
