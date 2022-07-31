class LoadData{
  String path = "sample.txt";
  String[] kif;
  LoadData() {
    kif = loadStrings(path);
  }
  
  void loadTxt() {
    for (int i=0; i<kif.length; i++){
      println(kif[i]);
    }
  }
  
}
