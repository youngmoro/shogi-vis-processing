class PieceData{
  Piece[][] table = new Piece[yokoL][tateL]; //0-8, 0-8
  
  PieceData() {
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
          setPiece(i, j, new Piece(name, reverse, player));
      }
    }
  }
  
  void setPiece(int i, int j, Piece piece) {
    i = 9-i;
    j = j-1;
    table[i][j] = piece;
  }
}
