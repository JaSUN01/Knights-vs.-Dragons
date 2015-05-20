class Castle {
  PVector loc;

  Castle(PVector location) {
    loc = location;

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
    scale(.65);
    rotate(angle);
    image(CastleImage, 0, 0 );
    popMatrix();
  }

  void update() {
  }

  void checkEdges() {
  }
}

