PImage CastleImage;
PImage KnightImage;
PImage clockImage;
PImage[] dragonImages = new PImage[27];

int playAreaWidth = 1500;
int playAreaHeight = 900;
int infoPanelWidth = 150;
int scrnWidth = playAreaWidth + infoPanelWidth;

int level;
Game game;


void setup() {
  size(scrnWidth, playAreaHeight);
  background(70, 82, 60);
  frameRate(50);
  initGame();
  imageMode(CENTER);
}

void draw() {
  background(70, 82, 60);
  game.run();
}

void initGame() {
  game = new Game();
  level = 0;
  loadImages();
}

void loadImages() {
  CastleImage = loadImage("Castle.png");
  clockImage = loadImage("clock.png");
  KnightImage = loadImage("k.png");
  for (int i = 0; i < 27; i++) {
    dragonImages[i] = loadImage("/dragons/d" + i + ".png");
  }
}

void mousePressed() {
  game.mousePressedHandler(new PVector(mouseX, mouseY));
}

void mouseMoved() {
  game.mouseMovedHandler(new PVector(mouseX, mouseY));
}

void keyPressed() {
  
  game.keyCodeHandler(keyCode);
}

