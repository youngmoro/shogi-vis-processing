void keyPressed() {
  if(key == CODED) {
    if(keyCode == RIGHT) {
      if(browseHand < game.ld.handsLength) browseHand += 1;
    }else if (keyCode == LEFT) {
      if(browseHand > 0) browseHand -= 1;
    }
  }
}
