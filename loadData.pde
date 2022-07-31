//kif形式のtxtファイルを読むクラス
class LoadData{
  String path;
  String[] kifFile;
  int handsStart;
  int handsLength;
  ArrayList<String> curHandList = new ArrayList<String>();
  ArrayList<String> preHandList = new ArrayList<String>();
  
  LoadData() {
    path = "sample.txt";
    kifFile = loadStrings(path);
    loadTxt();
    handsLength = curHandList.size();
    println("handsLength:" + handsLength);
  }
  
  void loadTxt() {
    for(int i=0; i<kifFile.length; i++) {
      if(kifFile[i].indexOf("手数")!=-1) handsStart=i+1;
    }
    for(int i=handsStart; i<kifFile.length; i++){
      kifFile[i] = formatText(kifFile[i]);
      separate(kifFile[i]);
      println(curHandList.get(i-handsStart));
    }
  }
  
  String formatText(String str) {
    String[] newStr = str.split(" ");
    str = newStr[1];
    return str;
  }
  
  void separate(String str){
    if(!str.contains("(")){
      curHandList.add(str);
      preHandList.add("99");
    }else{
      String[] newStr = str.split("\\(");
      curHandList.add(newStr[0]);
      preHandList.add(newStr[1].substring(0, newStr[1].length()-1));
    }
  }
}
