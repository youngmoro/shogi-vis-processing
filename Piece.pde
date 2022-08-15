//駒の情報をもつクラス
class Piece {
  String name = "";
  int reverse = 0; //通常0成り1
  int player = 0; //先手0後手1
  int yoko = 0; //1-9
  int tate = 0; //1-9 持ち駒の場合は横縦共に0
  
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
