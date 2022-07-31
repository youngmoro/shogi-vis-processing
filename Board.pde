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
          setPieceLayout(i, j);
          setPlayerLayout(data[i][j].player);
          if(data[i][j].reverse == 1){
            //text(成り, 0, 0);
          }else{
            text(data[i][j].name, 0, 0);
          }
        pop();
      }
     }
  }
  
  void setPieceLayout(int yoko, int tate) {
    textAlign(CENTER,TOP);
    float textHeight = textAscent() + textDescent();
    int textPosY = int(tateSize-textHeight)/2;
    fill(255);
    translate(yoko * yokoSize + yokoSize/2, tate * tateSize + textPosY, 1);
    translate(0, 0, 1);
  }
  
  void setPlayerLayout(int player){
    if(player == 0){
      translate(0, 73);
      rotateZ(PI);
    }
  }
}
