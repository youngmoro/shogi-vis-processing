class Board {
  int tateSize = 150;
  int yokoSize = 122;
  PieceData pd = new PieceData();
  Piece p = new Piece("", 0, 0); // for method
  Board() {
  }
  
  void draw() {
    drawEmpty();
    drawPieces(pd.table);
  }
  
  void drawEmpty() {
    fill(0);
    for(int i = 0; i < yokoL; i++){
      for(int j = 0; j < tateL; j++){
        rect(i * yokoSize, j * tateSize, yokoSize, tateSize);
      }
    }
  }
  
  void drawPieces(Piece[][] data) {
     for(int i = 0; i < yokoL; i++){
      for(int j = 0; j < tateL; j++){
        push();
          setDefaultLayout(i, j);
          setCustomLayout(data[i][j].reverse, data[i][j].player);
          if(data[i][j].reverse == 1) data[i][j].name = p.reverseName(data[i][j].name);
          text(data[i][j].name, 0, 0);
        pop();
      }
     }
  }
  
  void setDefaultLayout(int yoko, int tate) {
    fill(255);
    textAlign(CENTER,TOP);
    float textHeight = textAscent() + textDescent();
    int textPosY = int(tateSize-textHeight)/2;
    translate(yoko * yokoSize + yokoSize/2, tate * tateSize + textPosY, 1);
    translate(0, 0, 1);
  }
  
  void setCustomLayout(int reverse, int player){
    if(reverse == 1){ 
      textSize(tateSize/3);
      fill(255, 105, 180);
      if(player == 0) translate(0, 20);
      else translate(0, -20);
    }
    if(player == 0){
      translate(0, 73);
      rotateZ(PI);
    }
  }
}
