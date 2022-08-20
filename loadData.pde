//kif形式のtxtファイルを読むクラス
class LoadData{
  String path;
  String[] kifFile;
  int handsStart;
  int handsLength;
  ArrayList<String> curHandsStr = new ArrayList<String>();
  ArrayList<Integer> preHandsInt = new ArrayList<Integer>();
  
  LoadData() {
    path = "sample.txt";
    kifFile = loadStrings(path);
    loadTxt();
    handsLength = curHandsStr.size();
    println("手数:" + handsLength);
  }
  
  void loadTxt() {
    for(int i=0; i<kifFile.length; i++) {
      if(kifFile[i].indexOf("手数")!=-1) handsStart=i+1;
    }
    for(int i=handsStart; i<kifFile.length; i++) {
      kifFile[i] = formatText(kifFile[i]);
      separate(kifFile[i]);
    }
    formatToInt(); //curHandsStr例：77桂成　preHandsInt例：31
  }
  
  String formatText(String str) {
    String[] newStr = str.split(" ");
    str = newStr[1];
    return str;
  }
  
  void separate(String str){
    if(str.contains("投了")){
    }else if(!str.contains("(")) { //持ち駒から指した場合など
      curHandsStr.add(str);
      preHandsInt.add(0);
    }else {
      String[] newStr = str.split("\\(");
      curHandsStr.add(newStr[0]);
      String pre = newStr[1].substring(0, newStr[1].length()-1); //()削除
      preHandsInt.add(Integer.valueOf(pre));
    }

  }
  
  void formatToInt() {
    String cur = "";
    for(int i = 0; i < curHandsStr.size(); i++) {
      cur = curHandsStr.get(i);
      if(i>0 && cur.contains("同")) {
        //同を一個前の手に置き換え
        for(int j = 1; j < i; j++){
          if(!curHandsStr.get(i-j).contains("同")){
            cur = cur.replace("同", curHandsStr.get(i-j).substring(0, 2));
            break;
          }
        }
      }
      cur = cur.replace("　", "").replace("打", "");
      cur = cur.replace("一", "1").replace("１", "1");
      cur = cur.replace("二", "2").replace("２", "2");
      cur = cur.replace("三", "3").replace("３", "3");
      cur = cur.replace("四", "4").replace("４", "4");
      cur = cur.replace("五", "5").replace("５", "5");
      cur = cur.replace("六", "6").replace("６", "6");
      cur = cur.replace("七", "7").replace("７", "7");
      cur = cur.replace("八", "8").replace("８", "8");
      cur = cur.replace("九", "9").replace("９", "9");
      curHandsStr.set(i, cur);
      //print(cur);
      //println("手:"+i);
      //println(preHandsInt.get(i));
    }
  }
}
