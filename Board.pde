//１局面のデータを渡され、描画するクラス
class Board {
  int tateSize;
  int yokoSize;
  int capturedAreaSize;
  int rRed;
  int rGreen;
  int rBlue;
  PFont font;

  Board() {
    tateSize = 150;
    yokoSize = 122;
    capturedAreaSize = 300;
    rRed = 255;
    rGreen = 105;
    rBlue = 180;
    font = createFont("HiraginoSans-W1", tateSize/2);
    textFont(font);
  }
  
  void draw(Piece[] data) {
    push();
      drawSquares();
      drawPieces(data);
    pop();
  }
  
  void drawSquares() {
    fill(0);
    stroke(255);
    for(int i = 0; i < yokoL; i++){
      for(int j = 0; j < tateL; j++){
        rect(i * yokoSize, j * tateSize, yokoSize, tateSize);
      }
    }
    rect(-capturedAreaSize, 0, capturedAreaSize, capturedAreaSize);
    rect(yokoSize*9, tateSize*9-capturedAreaSize, capturedAreaSize, capturedAreaSize);
  }
  
  void drawPieces(Piece[] data) {
     for(int i = 0; i< data.length; i++){
       push();
         textSize(tateSize/2);
         setTextLayout(data[i].yoko, data[i].tate, data[i].reverse, data[i].player);
         text(data[i].name, 0, 0);
       pop();
     }
  }
  
  void setTextLayout(int yoko, int tate, int reverse, int player) {
    fill(255);
    textAlign(CENTER,TOP);
    float textHeight = textAscent() + textDescent();
    int textPosY = int(tateSize-textHeight)/2;
    //将棋盤に合わせるため左右反転
    if(yoko != 0 && tate != 0) {
      translate((10-yoko) * yokoSize + yokoSize/2, tate * tateSize + textPosY, 1);
      translate(-yokoSize, -tateSize, 1);
      if(player == 1) {
        translate(0, 73);
        rotateZ(PI);
      }
    }else {
      //持ち駒エリア
      if(player == 0) {
        translate(1200, 1100, 1);
      }else {
        translate(-100, 200, 1);
        translate(0, 73);
        rotateZ(PI);
      }
    }
    if(reverse == 1) fill(rRed, rGreen, rBlue);

  }
}
