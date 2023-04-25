class Pipes {
  float xPos, opening;
  boolean cashed = false;
  Pipes(int i) {
    xPos = 100+(i*200);
    opening = random(400)+100;
  }
  void drawPipe() {
    stroke(50);
    rect(xPos, 0, 10, opening-100);
   // pipeTAni.display(xPos,opening-100);
    rect(xPos, opening+100, 10, 800);
  }
  void checkPosition() {
    if (xPos<0) {
      xPos+=(200*3);
      opening = random(600)+100;
      cashed=false;
    }
    if (xPos<250&&cashed==false) {
      cashed=true;
      score++;
    }
  }
}
void reset() {
  end=true;
  score=0;
  b.yPos=400;
  for (int n = 0; n<3; n++) {
    p[n].xPos+=550;
    p[n].cashed = false;
  }
}
