//全てのマスに駒の情報を登録するクラス
class Phase{
  Piece[] pieces;
  int pieceNum;

  Phase() {
    pieceNum = 40;
    pieces = new Piece[pieceNum];
    int count = 0;
    for(int i=1; i<=yokoL; i++){
      for(int j=1; j<=tateL; j++){
          String name;
          int reverse = 0;
          int player = 1;
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
          if(j > 5) player = 0;
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
    int curReverse = (curHand.length()>3)? 1 : 0;
    int curPlayer = hand%2==0? 0 : 1;
    int curYoko = Character.getNumericValue(curYokoChar);
    int curTate = Character.getNumericValue(curTateChar);
    Piece[] curPieces = new Piece[pieceNum];
    for(int i = 0; i < pieceNum; i++) {
      //deep copy
      curPieces[i] = new Piece(
                      prevPieces[i].name,
                      prevPieces[i].reverse,
                      prevPieces[i].player,
                      prevPieces[i].yoko,
                      prevPieces[i].tate
                     );
    }
    for(int i = 0; i < pieceNum; i++) {
      //駒の置き換え　動かす前の駒と等しいかチェック
      if(curPieces[i].yoko == preYoko && 
         curPieces[i].tate == preTate &&
         curPieces[i].player == curPlayer &&
         (curPieces[i].name.equals(String.valueOf(curName)) || curPieces[i].reverseName(curPieces[i].name).equals(String.valueOf(curName)))
      ) {
        curPieces[i].name = String.valueOf(curName);
        curPieces[i].reverse = curReverse;
        if(curPieces[i].reverse == 1) curPieces[i].name = curPieces[i].reverseName(curPieces[i].name);
        else if(curPieces[i].isReverse(curPieces[i].name)) curPieces[i].reverse = 1;
        curPieces[i].yoko = curYoko;
        curPieces[i].tate = curTate;
      //取られた駒
      }else if(curPieces[i].yoko == curYoko && curPieces[i].tate == curTate) {
        curPieces[i].player = curPlayer;
        curPieces[i].name = curPieces[i].unReverseName(curPieces[i].name);
        curPieces[i].reverse = 0;
        curPieces[i].yoko = 0;
        curPieces[i].tate = 0;
      }
      if(curPieces[i].name.equals("香") || curPieces[i].name.equals("杏")) {
        //print(curPieces[i].yoko == preYoko);
        //print(curPieces[i].tate == preTate);
        //print(String.valueOf(curName));
        //print(curPieces[i].name.equals(String.valueOf(curName)) || curPieces[i].reverseName(curPieces[i].name).equals(String.valueOf(curName)));
        //println(curPieces[i].player == curPlayer);
      }
    }
    return curPieces;
  }
  
  void setPiece(Piece piece, int index) {
    if(piece.reverse == 1) piece.name = piece.reverseName(piece.name);
    pieces[index] = piece;
  }
}
