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
  
  void draw(Piece[] data, int alpha) {
    push();
      fill(0, 0, 0, alpha);
      stroke(255, 255, 255, alpha);
      drawSquares();
      fill(255);
      drawPieces(data);
    pop();
  }
  
  void drawSquares() {
    for(int i = 0; i < yokoL; i++){
      for(int j = 0; j < tateL; j++){
        rect(i * yokoSize, j * tateSize, yokoSize, tateSize);
      }
    }
    rect(-capturedAreaSize, 0, capturedAreaSize, capturedAreaSize);
    rect(yokoSize*9, tateSize*9-capturedAreaSize, capturedAreaSize, capturedAreaSize);
  }
  
  void drawPieces(Piece[] data) {
     textAlign(CENTER,TOP);
     textSize(tateSize/2);
     int firstCapturedNum = 0;
     int secondCapturedNum = 0;
     for(int i = 0; i< data.length; i++){
       push();
         if(data[i].yoko != 0 && data[i].tate != 0) setTextLayout(data[i]);
         else {
           int cap = 0;
           if(data[i].player==0) {
             firstCapturedNum++;
             cap = firstCapturedNum;
           }else {
             secondCapturedNum++;
             cap = secondCapturedNum;
           }
           setCapturedTextLayout(data[i], cap-1);
         }
       pop();
     }
  }
  
  void setTextLayout(Piece data) {
    float textHeight = textAscent() + textDescent();
    int textPosY = int(tateSize-textHeight)/2;
    //将棋盤に合わせるため左右反転
      translate((10-data.yoko) * yokoSize - yokoSize/2, data.tate * tateSize + textPosY, 1);
      translate(0, -tateSize, 1);
      if(data.player == 1) {
        translate(0, 73);
        rotateZ(PI);
      }
      if(data.reverse == 1) fill(rRed, rGreen, rBlue);
      text(data.name, 0, 0);
   }
   
   void setCapturedTextLayout(Piece data, int cap) {
      int tmpx = cap%3;
      int tmpy = cap/3;
      if(data.player == 0) {
        translate(1170 + tmpx*70, 1100 + tmpy*70, 1);
        text(data.name, 0, 0);
      }else {
        translate(-70-tmpx*70, 253 - tmpy*70, 1);
        rotateZ(PI);
        text(data.name, 0, 0);
      }
    }
}
