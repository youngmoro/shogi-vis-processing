//Boadsに全てのPhaseのデータを渡すクラス
class Game {
  Board board;
  ArrayList<Piece[]> phaseList;
  LoadData ld;
  Phase phase;
  int distance;
  
  Game() {
    board = new Board();
    ld = new LoadData();
    phase = new Phase();
    phaseList = new ArrayList<Piece[]>();
    addPhase();
    distance = 200;
  }
  
  void draw3D() {
    push();
      translate(-300+board.yokoSize*-9/2, 50-board.tateSize*9/2);
      for(int i = 0; i < ld.handsLength+1; i++){
        push();
          translate(0, 0, 500 + 50*(browseHand-i));
          int alpha = 100;
          //if(i>browseHand+30) hint(DISABLE_DEPTH_SORT);
          if(i>=browseHand){
            board.draw(phaseList.get(i), alpha, i==browseHand);
          }
        pop();
      }
    pop();
  }
  
  void draw2D() {
    push();
      translate(1000, 100);
      scale(0.25);
      text(browseHand + "手目", 0, -100);
      board.draw(phaseList.get(browseHand), 0, true);
    pop();
  }
  
  void addPhase() {
    phaseList.add(phase.pieces); //開始局面
    for(int i = 0; i< ld.handsLength; i++){
      //局面と次の一手を渡す
      phaseList.add(phase.createPhase(phaseList.get(i), ld.preHandsInt.get(i), ld.curHandsStr.get(i), i));
    }
  }
}
