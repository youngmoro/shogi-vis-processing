//１局面のデータを渡され、描画するクラス
class Board {
  int tateSize;
  int yokoSize;
  int capturedAreaSize;
  int rRed;
  int rGreen;
  int rBlue;
  PFont font;
  int firstCapturedNum;
  int secondCapturedNum;
  
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
     fill(255);
     textAlign(CENTER,TOP);
     textSize(tateSize/2);
     firstCapturedNum = 0;
     secondCapturedNum = 0;
     for(int i = 0; i< data.length; i++){
       push();
         if(data[i].yoko != 0 && data[i].tate != 0) ;
         else {
           if(data[i].player==0) firstCapturedNum++;
           else secondCapturedNum++;
           setCapturedTextLayout(data[i]);
         }
       pop();
     }
  }
  
  void setTextLayout(Piece data) {
    float textHeight = textAscent() + textDescent();
    int textPosY = int(tateSize-textHeight)/2;
    //将棋盤に合わせるため左右反転
      translate((10-data.yoko) * yokoSize + yokoSize/2, data.tate * tateSize + textPosY, 1);
      translate(-yokoSize, -tateSize, 1);
      if(data.player == 1) {
        translate(0, 73);
        rotateZ(PI);
      }
      if(data.reverse == 1) fill(rRed, rGreen, rBlue);
      text(data.name, 0, 0);
   }
   
   void setCapturedTextLayout(Piece data) {
      //将棋盤に合わせるため左右反転
      int tmpx = 0;
      int tmpy = 0;
      if(data.player == 0) {
        for (int i=0; i<firstCapturedNum; i++){
          //if(i>5) {
          //  tmpx = i-5;
          //  tmpy = 2;
          //}else if(i>2) {
          //  tmpx = i-2;
          //  tmpy = 1;
          //}else {
          //  tmpx = i;
          //  tmpy = 0;
          //}
          translate(1200 + tmpx*100, 1100 + tmpy*50, 1);
          text(data.name, 0, 0);
        }
      }else {
        for (int i=0; i<secondCapturedNum; i++){
          //if(i>5) {
          //  tmpx = i-5;
          //  tmpy = 2;
          //}else if(i>2) {
          //  tmpx = i-2;
          //  tmpy = 1;
          //}else {
          //  tmpx = i;
          //  tmpy = 0;
          //}
          translate(-100 - tmpx*100, 200 - tmpy*50, 1);
          translate(0, 73);
          rotateZ(PI);
          text(data.name, 0, 0);
        }
      }
    }
}
