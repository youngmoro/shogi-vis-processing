//駒の情報をもつクラス
class Piece {
  String name;
  int reverse; //通常0成り1
  int player; //先手0後手1
  int yoko;
  int tate;
  
  Piece(String name, int reverse, int player, int yoko, int tate) {
    this.name = name;
    this.reverse = reverse;
    this.player = player;
    this.yoko = yoko;
    this.tate = tate;
  }
  
  String reverseName(String name) {
    if(name=="歩" || name=="と") return "と";
    else if(name=="角") return "馬";
    else if(name=="飛") return "龍";
    else if(name=="香") return "杏";
    else if(name=="桂") return "圭";
    else if(name=="銀") return "全";
    else return name;
  }
}
