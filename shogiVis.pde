import peasy.*;
PeasyCam cam;
Board board;
int tateL = 9;
int yokoL = 9;

void setup(){
  size(800, 800, P3D);
  board = new Board();
  int textSize = board.tateSize/2;
  PFont font = createFont("HiraginoSans-W1", textSize);
  textFont(font);
  cam = new PeasyCam(this, 3000);
  cam.setMinimumDistance(-10000);
  cam.setMaximumDistance(10000);
}

void draw(){
  background(0);
  lights();
  stroke(255);
  push();
    translate(board.yokoSize*-9/2, board.tateSize*-9/2, 1000);
    for(int i = 0; i < 10; i++){
      translate(0, 0, -100);
      board.draw();
    }
  pop();
}
