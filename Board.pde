//１局面のデータを渡され、描画するクラス
class Board {
  int tateSize;
  int yokoSize;
  int rRed;
  int rGreen;
  int rBlue;
  PFont font;

  Board() {
    tateSize = 150;
    yokoSize = 122;
    rRed = 255;
    rGreen = 105;
    rBlue = 180;
    font = createFont("HiraginoSans-W1", tateSize/2);
    textFont(font);
  }
  
  void draw(Piece[] data) {
    drawSquares();
    drawPieces(data);
  }
  
  void drawSquares() {
    fill(0);
    stroke(255);
    for(int i = 0; i < yokoL; i++){
      for(int j = 0; j < tateL; j++){
        rect(i * yokoSize, j * tateSize, yokoSize, tateSize);
      }
    }
    //TODO: 持ち駒エリアをついか
  }
  
  void drawPieces(Piece[] data) {
     for(int i = 0; i< data.length; i++){
       push();
         setTextLayout(data[i].yoko, data[i].tate);
         setIrregularLayout(data[i].reverse, data[i].player);
         text(data[i].name, 0, 0);
       pop();
     }
  }
  
  void setTextLayout(int yoko, int tate) {
    fill(255);
    textAlign(CENTER,TOP);
    float textHeight = textAscent() + textDescent();
    int textPosY = int(tateSize-textHeight)/2;
    translate(yoko * yokoSize + yokoSize/2, tate * tateSize + textPosY, 1);
    translate(0, 0, 1);
  }
  
  void setIrregularLayout(int reverse, int player){
    if(reverse == 1) fill(rRed, rGreen, rBlue);
    if(player == 0) {
      translate(0, 73);
      rotateZ(PI);
    }
  }
}
