import peasy.*;
PeasyCam cam;
Game game;
final int yokoL = 9;
final int tateL = 9;

void setup() {
  size(800, 800, P3D);
  setCam();
  game = new Game();
}

void draw() {
  background(0);
  lights();
  game.draw();
}

void setCam() {
  cam = new PeasyCam(this, 3000);
  cam.setMinimumDistance(-10000);
  cam.setMaximumDistance(10000);
}
