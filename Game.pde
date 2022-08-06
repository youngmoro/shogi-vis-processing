//Boadsに全ての局面のデータを渡すクラス
class Game {
  Board board;
  ArrayList<Piece[]> phaseList;
  LoadData ld;
  Phase phase;
  
  Game() {
    board = new Board();
    ld = new LoadData();
    phase = new Phase();
    phaseList = new ArrayList<Piece[]>();
    addData();
  }
  
  void draw() {
    push();
    translate(board.yokoSize*-9/2, board.tateSize*-9/2, 1000);
    for(int i = 0; i < ld.handsLength; i++){
      translate(0, 0, -100);
      board.draw(phaseList.get(0)); //後で.get(i)に変更
    }
    pop();
  }
  
 void addData() {
    phase.initialize();
    phaseList.add(phase.pieces); //開始局面
    for(int i = 0; i< ld.handsLength; i++){
      //一つ前の局面と一手前と現在の指手を渡す
      phaseList.add(phase.addPhase(phaseList.get(i), ld.preHandsInt.get(i), ld.curHandsStr.get(i)));
    }
  }
}
