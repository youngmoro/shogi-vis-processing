class LoadData{
  String path = "sample.txt";
  String[] kifFile;
  int handsStart;
  ArrayList<String> handsList = new ArrayList<String>();
  ArrayList<String> curHandsList = new ArrayList<String>();
  ArrayList<String> preHandsList = new ArrayList<String>();
  
  LoadData() {
    kifFile = loadStrings(path);
    loadTxt();
  }
  
  void loadTxt() {
    for(int i=0; i<kifFile.length; i++) {
      if(kifFile[i].indexOf("手数")!=-1) handsStart=i+1;
    }
    for(int i=handsStart; i<kifFile.length-handsStart; i++){
      kifFile[i] = formatText(kifFile[i]);
      handsList.add(kifFile[i]);
      separate(kifFile[i]);
      //println(curHandsList.get(i-handsStart));
      //println(preHandsList.get(i-handsStart));
    }
  }
  
  String formatText(String str) {
    String[] newStr = str.split(" ");
    str = newStr[1];
    return str;
  }
  
  void separate(String str){
    //String[] newStr = str.split("(");
    //curHandsList.add(newStr[0]);
    //preHandsList.add(newStr[1]);
  }
}
