class Game {
  // +++++++++++ Lists of game objects
  ArrayList<Button> buttons  = new ArrayList<Button>();
  ArrayList<Dragon> enemies  = new ArrayList<Dragon>();
  ArrayList<Arrow> arrows = new ArrayList<Arrow>();
  
  //  Instance varaibles (Properties)  +++++++++++++++++++++++++
  boolean gameStarted = false;

  int numBoids = 25;
  InfoArea infoArea;
  Knight knight;
  Dragon dragon;
  Castle castle;
  Flock flock;

  //  Constructor  +++++++++++++++++++++++++++++++
  Game() {
    // When game constructed, create buttons, flock, areas, and game objects
    makeButtons(); 
    infoArea = new InfoArea(new PVector(playAreaWidth, 0), infoPanelWidth, playAreaHeight, color(135, 95, 136));
    initGameObjects();
    generateFlock(numBoids);

  }

  //  Methods (Behaviors)  +++++++++++++++++++++++++
  void initGameObjects() {
    knight = new Knight(new PVector(600, 600), new PVector(0, 0));
    castle = new Castle(new PVector(250, playAreaHeight/2));//(scrnWidth/15, playAreaHeightarrows = new ArrayList<Arrow>();
  }


  void generateFlock(int numBoids) {
    // Declare a flock     
    flock = new Flock();
    // Generate a flock  
    for (int i = 0; i < numBoids; i++) {
      flock.addBoid(new Boid(width-50, height/2));
    }
  }

  void run() {
    infoArea.run();
    knight.run();
    castle.run();
    flock.run();
    knight.run();
    if(arrows.size() > 0){
      for(int i = arrows.size() - 1; i >= 0; i--){
        arrows.get(i).run();
        if(arrows.get(i).getIsDead()) arrows.remove(i);

      }
    }
    //println("Arrows length " + arrows.size());
  }

  void keyCodeHandler(int kc) {
    // what do we do with keyboard input?
    if (kc == LEFT) knight.loc.x = knight.loc.x - 5;
    if (kc == RIGHT) knight.loc.x = knight.loc.x + 5;
    if (kc == UP) knight.loc.y = knight.loc.y - 11;
    if (kc == DOWN) knight.loc.y = knight.loc.y + 11;
  }

  void mousePressedHandler(PVector mouse) {
    // what do we do when mouse is clicked?
  }

  void mouseMovedHandler(PVector mouseLoc) {
    // what do we do when mouse is moved?
  }

  void makeButtons() {
    // width and heith of game buttons
    int w = 300;
    int h = 100;
    //  add buttons to an array list of buttons with location, size, and color
    //  load buttons into button aray
    buttons.add( new Button("Play", new PVector(width/2, 200), w, h, color(45, 54, 74)));
    buttons.add( new Button("Instructions", new PVector(width/2, 400), w, h, color(45, 54, 74)));
    buttons.add( new Button("Reset?", new PVector(width/2, 200), w, h, color(45, 54, 74)));
  }
} // end Game class

