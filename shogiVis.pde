import peasy.*;
import controlP5.*;  
PeasyCam cam;
Game game;
final int yokoL = 9;
final int tateL = 9;
int browseHand = 0;

void setup() {
  size(800, 800, P3D);
  setCam();
  game = new Game();
  setupGui();
}

void draw() {
  background(0);
  lights();
  game.draw();
  drawGui(true);
}

void setCam() {
  cam = new PeasyCam(this, 4000);
  cam.setMinimumDistance(-10000);
  cam.setMaximumDistance(10000);
}
