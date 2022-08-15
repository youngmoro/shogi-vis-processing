void keyPressed() {
  if(key == CODED) {      // コード化されているキーが押された
    if(keyCode == RIGHT) {    // キーコードを判定
      browseHand += 1;
    }else if (keyCode == LEFT) {
      browseHand -= 1;
    }
  }
}
