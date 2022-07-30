class Piece {
  String name;
  int reverse; //通常0成り1
  int player; //先手0後手1
  
  Piece(String name, int reverse, int player) {
    this.name = name;
    this.reverse = reverse;
    this.player = player;
  }
}
