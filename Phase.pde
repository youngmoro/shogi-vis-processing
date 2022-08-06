//全てのマスに駒の情報を登録するクラス
class Phase{
  Piece[] pieces;

  Phase() {
  }
  
  void initialize() {
    pieces = new Piece[40];
    int count = 0;
    for(int i=1; i<=yokoL; i++){
      for(int j=1; j<=tateL; j++){
          String name;
          int reverse = 0;
          int player = 0;
          if(j==3 || j==7) name = "歩";
          else if((i==2 && j==2) || (i==8 && j==8)) name = "角";
          else if((i==8 && j==2) || (i==2 && j==8)) name = "飛";
          else if(j==1 || j==9){
            if(i==1 || i==9) name = "香";
            else if(i==2 || i==8) name = "桂";
            else if(i==3 || i==7) name = "銀";
            else if(i==4 || i==6) name = "金";
            else name = "玉";
          }
          else name = "";
          if(j > 5) player = 1;
          if(name!="") {
            setPiece(new Piece(name, reverse, player, i, j), count);
            count++;
          }
      }
    }
  }
  
  Piece[] addPhase(Piece[] prevPieces, String curHand) {
    return pieces;
  }
  
  void setPiece(Piece piece, int index) {
    piece.yoko = 9-piece.yoko;
    piece.tate = piece.tate-1;
    if(piece.reverse == 1) piece.name = piece.reverseName(piece.name);
    pieces[index] = piece;
  }
}
