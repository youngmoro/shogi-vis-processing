//全てのマスに駒の情報を登録するクラス
class Phase{
  Piece[] pieces;
  int numOfPiece;

  Phase() {
    numOfPiece = 40;
    pieces = new Piece[numOfPiece];
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
  
  Piece[] createPhase(Piece[] prevPieces, int preHand, String curHand, int hand) {
    int preYoko = preHand/10;
    int preTate = preHand%10;
    char curYokoChar = curHand.charAt(0);
    char curTateChar = curHand.charAt(1);
    char curName = curHand.charAt(2);
    int curReverse = curHand.length()>3? 1 : 0;
    int curPlayer = hand%2==0? 1 : 0;
    int curYoko = Character.getNumericValue(curYokoChar);
    int curTate = Character.getNumericValue(curTateChar);
    
    
    Piece[] curPieces = new Piece[numOfPiece];
    for(int i = 0; i < numOfPiece; i++) {
      
      //deep copy
      curPieces[i] = new Piece(
                      prevPieces[i].name,
                      prevPieces[i].reverse,
                      prevPieces[i].player,
                      prevPieces[i].yoko,
                      prevPieces[i].tate
                     );
                     
      //置き換え
      if(curPieces[i].yoko == preYoko && curPieces[i].tate == preTate) {
        curPieces[i].name = String.valueOf(curName);
        curPieces[i].reverse = curReverse;
        if(curPieces[i].reverse == 1) curPieces[i].name = curPieces[i].reverseName(curPieces[i].name);
        curPieces[i].player = curPlayer;
        curPieces[i].yoko = curYoko;
        curPieces[i].tate = curTate;
      }else{
      }
    }
    return curPieces;
  }
  
  void setPiece(Piece piece, int index) {
    if(piece.reverse == 1) piece.name = piece.reverseName(piece.name);
    pieces[index] = piece;
  }
}
