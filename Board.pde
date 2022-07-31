//１局面のデータを渡され、描画するクラス
class Board {
  int tateSize = 150;
  int yokoSize = 122;
  
  Board() {
  }
  
  void draw(Piece[][] table) {
    drawEmpty();
    drawPieces(table);
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
          setText(i, j);
          reflectOptions(data[i][j].reverse, data[i][j].player);
          text(data[i][j].name, 0, 0);
        pop();
      }
     }
  }
  
  void setText(int yoko, int tate) {
    fill(255);
    textAlign(CENTER,TOP);
    float textHeight = textAscent() + textDescent();
    int textPosY = int(tateSize-textHeight)/2;
    translate(yoko * yokoSize + yokoSize/2, tate * tateSize + textPosY, 1);
    translate(0, 0, 1);
  }
  
  void reflectOptions(int reverse, int player){
    if(reverse == 1) fill(255, 105, 180);
    if(player == 0) {
      translate(0, 73);
      rotateZ(PI);
    }
  }
}
