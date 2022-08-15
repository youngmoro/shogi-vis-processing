// slider: 右上に並べる

ControlP5 gui;
Slider hand; 

void setupGui(){
  gui = new ControlP5(this);
  gui.setAutoDraw(false);

  hand = gui.addSlider("hand")
    .setLabel("hand")
    .setRange(0, game.ld.handsLength-1)
    .setValue(0)
    .setPosition(10, 30)
    .setSize(120, 30)
    .setNumberOfTickMarks(game.ld.handsLength);
}

void drawGui(boolean isShowGui) {
  cam.beginHUD();
  stroke(255);
  fill(255);
  if (isShowGui) gui.draw();
  cam.endHUD();

  if (gui.isMouseOver() && cam.isActive()) {
    cam.setActive(false);
  } else if (!gui.isMouseOver() && !cam.isActive()) {
    cam.setActive(true);
  }
}
