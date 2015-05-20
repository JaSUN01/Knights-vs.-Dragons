class Knight {

  PVector loc, vel, acc, dir;
  int arrowCoolDown = 0;
  Knight(PVector location, PVector velocity) {
    loc = location;
    vel = velocity;
    acc = new PVector(0, 0);
    arrowCoolDown = millis();
  }


  void run() {
    display();
    update();
    checkEdges();
  }

  void display() {
    float angle = radians(0);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(angle);
    image(KnightImage, 0, 0 );
    popMatrix();
  }

  void update() {
    //If my knight with200 px of dragon, then shoot arrow
    //  check knight against every dragon
    for (int i = 0; i < game.flock.dragons.size() - 1; i++) {
      if (loc.dist(game.flock.dragons.get(i).loc) < 200 && (millis() - arrowCoolDown) > 400) {
        arrowCoolDown = millis();
        makeArrow(i);
      }
    }
  }

  void makeArrow(int i) {
    float dx = loc.x - game.flock.dragons.get(i).loc.x;
    float dy = loc.y - game.flock.dragons.get(i).loc.y;
    float angle = atan2(dy, dx);
    game.arrows.add(new Arrow(loc, angle));
  }
  void checkEdges() {
  }
}

