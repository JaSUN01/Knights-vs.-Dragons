class Dragon {

  PVector loc, vel, acc, dir;
  int dragonCount = 0;
  float angle;
  //  ++++++++++++++++++++++++++++++++++++++++  
  Dragon(PVector location, PVector velocity) {
    loc = location;
    vel = velocity;
    acc = new PVector(0, 0);
  }


  void run() {
    display();
    update();
    checkEdges();
  }

  void display() {
    imageMode(CENTER);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(angle);
    //image(DragonImage, 0, 0);
    if (dragonCount >25)dragonCount = 0;

    popMatrix();
  }

  void update() {
  }

  void checkEdges() {
  }
}

