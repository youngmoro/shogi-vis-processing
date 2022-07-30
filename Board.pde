class Board {
  int tateSize = 150;
  int yokoSize = 122;
  PieceData pd = new PieceData();
  
  Board() {
  }
  
  void draw() {
    drawEmpty();
    drawPieces(pd.table);
  }
  
  void drawEmpty() {
    fill(0);
    for(int i = 0; i < tateL; i++){
      for(int j = 0; j < yokoL; j++){
        rect(j * yokoSize, i * tateSize, yokoSize, tateSize);
      }
    }
  }
  
  void drawPieces(Piece[][] data) {
     for(int i = 0; i < tateL; i++){
      for(int j = 0; j < yokoL; j++){
        push();
          setPieceInfo(i, j);
          setPlayerInfo(data[i][j].player);
          if(data[i][j].reverse == 1){
            //text(成り, 0, 0);
          }else{
            text(data[i][j].name, 0, 0);
          }
        pop();
      }
     }
  }
  
  void setPieceInfo(int tate, int yoko) {
    textAlign(CENTER,TOP);
    float textHeight = textAscent() + textDescent();
    int textPosY = int(tateSize-textHeight)/2;
    fill(255);
    translate(yoko * yokoSize + yokoSize/2, tate * tateSize + textPosY, 1);
    translate(0, 0, 1);
  }
  
  void setPlayerInfo(int player){
    if(player == 0){
      translate(0, 73);
      rotateZ(PI);
    }
  }
}
