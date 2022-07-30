class PieceData{
  int yoko;
  int tate;
  Piece[][] table;
  
  PieceData() {
    table = new Piece[tateL][yokoL];
    for(int i=0; i<yokoL; i++){
      yoko = yokoL-i;
      for(int j=1; j<=tateL; j++){
          tate = j;
          if(tate==3){
            table[tate-1][yoko-1] = new Piece("歩", 0, 0);
          }else if(tate==7){
            table[tate-1][yoko-1] = new Piece("歩", 0, 1);
          }else {
            table[tate-1][yoko-1] = new Piece("", 0, 0);
          }
      }
    }
  } 
}

//  for(int tate = 0; tate < 9; tate++){
//    for(int yoko = 0; yoko < 9; yoko++){
//      push();
//        translate(yoko * board.yokoLength + 16, tate * board.tateLength + 48);
//        if(tate==6) text("歩", 0, 0);
//        else if(tate==7){
//          if(yoko==1) text("角", 0, 0);
//          else if(yoko==7) text("飛", 0, 0);
//        }
//        else if(tate==8){
//          if(yoko==0 || yoko==8) text("香", 0, 0);
//          else if(yoko==1 || yoko==7) text("桂", 0, 0);
//          else if(yoko==2 || yoko==6) text("銀", 0, 0);
//          else if(yoko==3 || yoko==5) text("金", 0, 0);
//          else text("玉", 0, 0);
//        }
//      pop();}}

  
  //        
//        rotateZ(PI);
//        if(tate==2) text("歩", 0, 0);
//        else if(tate==1){
//          if(yoko==7) text("角", 0, 0);
//          else if(yoko==1) text("飛", 0, 0);
//        }
//        else if(tate==0){
//          if(yoko==0 || yoko==8) text("香", 0, 0);
//          else if(yoko==1 || yoko==7) text("桂", 0, 0);
//          else if(yoko==2 || yoko==6) text("銀", 0, 0);
//          else if(yoko==3 || yoko==5) text("金", 0, 0);
//          else text("玉", 0, 0);
//        }
