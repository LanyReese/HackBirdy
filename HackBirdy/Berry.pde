class Berry {
  float xPos, yPos, ySpeed;
  Berry() {
    xPos = width/2;
    yPos = height/2;
  }

  void drawBerry() {
    stroke(255);
    noFill();
    strokeWeight(.5);
    birdyAnimation.display(xPos, yPos);
  }

  void jump() {
    ySpeed=-10;
  }
  void fall() {
    ySpeed+=0.4;
  }

  void move() {
    yPos+=ySpeed;
    for (int i = 0; i<3; i++) {
      p[i].xPos-=3;
    }
  }
  void checkCollisions() {
    if (yPos>820) {
      end=false;
    }
    for (int i = 0; i<3; i++) {
      if ((xPos<p[i].xPos+20&&xPos>p[i].xPos-20)&&
        (yPos<p[i].opening-90||yPos>p[i].opening+90)) {
        end=false;
      }
    }
  }
}
