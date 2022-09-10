//駒の情報をもつクラス
class Piece {
  String name;
  int reverse; //通常0成り1
  int player; //先手0後手1
  int yoko; //1-9
  int tate; //1-9 持ち駒の場合は横縦共に0
  
  //TODO 指されたコマの色を変える→黄色など
  
  Piece(String name, int reverse, int player, int yoko, int tate) {
    this.name = name;
    this.reverse = reverse;
    this.player = player;
    this.yoko = yoko;
    this.tate = tate;
  }
  
  String reverseName(String name) {
    if(name.equals("歩")) return "と";
    else if(name.equals("角")) return "馬";
    else if(name.equals("飛")) return "龍";
    else if(name.equals("香")) return "杏";
    else if(name.equals("桂")) return "圭";
    else if(name.equals("銀")) return "全";
    else return name;
  }
  
  String unReverseName(String name) {
    if(name.equals("と")) return "歩";
    else if(name.equals("馬")) return "角";
    else if(name.equals("龍")) return "飛";
    else if(name.equals("杏")) return "香";
    else if(name.equals("圭")) return "桂";
    else if(name.equals("全")) return "銀";
    else return name;
  }
  
  boolean isReverse(String name) {
    if (name.equals("と") ||
        name.equals("馬") ||
        name.equals("龍") ||
        name.equals("杏") ||
        name.equals("圭") ||
        name.equals("全")
       ) return true;
     else return false;
  }
}
