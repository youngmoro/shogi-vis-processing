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
  
  void draw() {
    push();
      translate(-800+board.yokoSize*-9/2, -board.tateSize*9/2, 1000);
      for(int i = 0; i < ld.handsLength+1; i++){
        push();
          if(i == browseHand){
            translate(1600, 0);
            text(browseHand + "手目", 100, -100);
            board.draw(phaseList.get(i));
          }
        pop();
        push();
          translate(0, 0, -100*i + 100*browseHand);
          board.drawPieces(phaseList.get(i));
        pop();
      }
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
