import processing.sound.*;
SoundFile pewSound;

//////fucking add background sound you dumb bitch!!!!!!!!!
SoundFile background;

Animation birdyAnimation;
PImage[] birdyImages=new PImage[4];
Animation pipeTAni;
Animation pipeBAni;
PImage[] pipeTImages=new PImage[1];
PImage[] pipeBImages=new PImage[1];

Berry b = new Berry();
Pipes[] p = new Pipes[4];
boolean end=false;
boolean intro=true;
int score=0;
int state=0;

void setup() {
  size(800, 800);
  pewSound=new SoundFile(this, "pew.wav");
  pewSound.rate(2);
  background=new SoundFile(this, "background.wav");
  for (int i = 0; i<3; i++) {
    p[i]=new Pipes(i);
  }
  for (int index=0; index<4; index++) {
    birdyImages[index]=loadImage("birdy"+index+".png");
  }
  float scale=0.15;
  birdyAnimation=new Animation(birdyImages, scale, 3);
}


void draw() {
  //

  if (!background.isPlaying()==false) {
    background.play();
  }
  switch(state) {
  case 0:
    background(90);
    text("press Space Bar to start", width/2, height/2);
    break;
  case 1:
    background(255, 183, 235);
    if (score>=15) {
      background(195, 255, 183);
    }
    if (score>=30) {
      background(183, 219, 255);
    }
    if (end) {
      b.move();
    }
    b.drawBerry();
    if (end) {
      b.fall();
    }
    b.checkCollisions();
    for (int i = 0; i<3; i++) {
      p[i].drawPipe();
      p[i].checkPosition();
    }

    fill(0);
    stroke(255);
    textSize(32);

    if (end) {
      rect(20, 20, 100, 50);
      fill(255);
      text(score, 30, 58);
    } else {
      rect(150, 200, 325, 50);
      fill(255);
      if (intro) {
        text("press mouse to bounce", 155, 240);
      } else {
        background(0);
        text("game over", 170, 140);
        text("score", 180, 240);
        text(score, 280, 240);
        text("press space to return home", 180, 340);
        state+=1;
      }
    }
    break;
  }
  if (score>=45) {
    background(42);
    text("You Won!!", width/2, height/2);
  }
}


void mousePressed() {
  b.jump();
  intro=false;
  if (mousePressed==true) {
    pewSound.play();
    birdyAnimation.isAnimating=true;
  }
  if (end==false) {
    reset();
  }
}

void keyPressed() {
  if (key==' ') {
    state+=1;
    if (state>=2) {
      state=0;
    }
  }
}
