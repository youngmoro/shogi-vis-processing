class Piece {
  String name;
  int reverse; //通常0成り1
  int player; //先手0後手1
  
  Piece(String name, int reverse, int player) {
    this.name = name;
    this.reverse = reverse;
    this.player = player;
  }
  
  String reverseName(String name) {
    String nari = "";
    if(name=="歩" || name=="と") nari = "と";
    else if(name=="角") nari = "馬";
    else if(name=="飛") nari = "龍";
    else if(name=="香") nari = "杏";
    else if(name=="桂") nari = "圭";
    else if(name=="銀") nari = "全";
    else nari = name;
    return nari;
  }
}
