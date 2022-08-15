// slider: 右上に並べる

ControlP5 gui;
Slider handSlider; 

void setupGui(){
  gui = new ControlP5(this);
  gui.setAutoDraw(false);

  handSlider = gui.addSlider("browseHand")
    .setLabel("hand")
    .setRange(0, game.ld.handsLength)
    //.setValue(0)
    .setPosition(10, 30)
    .setSize(game.ld.handsLength, 30);
}

void drawGui(boolean isShowGui) {
  cam.beginHUD();
  stroke(255);
  fill(255);
  if (isShowGui) {
    handSlider.setValue(browseHand);
    gui.draw();
  }
  cam.endHUD();

  if (gui.isMouseOver() && cam.isActive()) {
    cam.setActive(false);
  } else if (!gui.isMouseOver() && !cam.isActive()) {
    cam.setActive(true);
  }
}
