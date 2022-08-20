import peasy.*;
import controlP5.*;  
import processing.opengl.*;
PeasyCam cam;
Game game;
final int yokoL = 9;
final int tateL = 9;
int browseHand;

void setup() {
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
  game.draw();
  drawGui(true);
}

void setCam() {
  cam = new PeasyCam(this, 4000);
  cam.setMinimumDistance(-10000);
  cam.setMaximumDistance(20000);
}
