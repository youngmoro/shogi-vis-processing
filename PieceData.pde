class PieceData{
  Piece[][] table = new Piece[yokoL][tateL]; //0-8, 0-8
  
  PieceData() {
    for(int i=1; i<=yokoL; i++){
      for(int j=1; j<=tateL; j++){
          if(j==3) setPiece(i, j, new Piece("歩", 0, 0));
          else if(j==7) setPiece(i, j, new Piece("歩", 0, 1));
          else if(i==2 && j==2) setPiece(i, j, new Piece("角", 0, 0));
          else if(i==8 && j==2) setPiece(i, j, new Piece("飛", 0, 0));
          else if(i==2 && j==8) setPiece(i, j, new Piece("飛", 0, 1));
          else if(i==8 && j==8) setPiece(i, j, new Piece("角", 0, 1));
          else if(j==1){
            if(i==1 || i==9) setPiece(i, j, new Piece("香", 0, 0));
            else if(i==2 || i==8) setPiece(i, j, new Piece("桂", 0, 0));
            else if(i==3 || i==7) setPiece(i, j, new Piece("銀", 0, 0));
            else if(i==4 || i==6) setPiece(i, j, new Piece("金", 0, 0));
            else setPiece(i, j, new Piece("玉", 0, 0));
          }else if(j==9){
            if(i==1 || i==9) setPiece(i, j, new Piece("香", 0, 1));
            else if(i==2 || i==8) setPiece(i, j, new Piece("桂", 0, 1));
            else if(i==3 || i==7) setPiece(i, j, new Piece("銀", 0, 1));
            else if(i==4 || i==6) setPiece(i, j, new Piece("金", 0, 1));
            else setPiece(i, j, new Piece("玉", 0, 1));
          }
          else setPiece(i, j, new Piece("", 0, 0));
      }
    }
  }
  
  void setPiece(int i, int j, Piece piece) {
    i = 9-i;
    j = j-1;
    table[i][j] = piece;
  }
}
