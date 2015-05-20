// +++++++++++++++++++++++++++++++++++++++++++++++++++  InfoArea
class InfoArea {

  PVector loc;
  int myWidth, myHeight;
  color clr;
  Clock clock;
  InfoArea(PVector location, int w, int h, color c) {
    loc = location;
    myWidth = w;
    myHeight = h;
    clr = c;
    // clock = new Clock(PVector cloc);
  }

  InfoArea(PVector location, int w, int h ) {

    loc = location;
    myWidth = w;
    myHeight = h;
    clr = color(74, 80, 67);
    initClock();
  }

  void run() {
    display();
  }


  void display() {
    int yOffset = 150;
    int xOffset = 15;
    fill(42, 44, 32);
    stroke(2);
    rect(loc.x, loc.y, myWidth, myHeight, 20);
    textSize(20);
    //Score rectangle
    color c1 = color(65, 45, 65, 110);
    color c2 = color(100, 103, 79);

    pushMatrix();
    translate(loc.x, loc.y);

    makeInfoRect(xOffset, 0*yOffset+40, c1, c2, "Level");
    fill(255, 255, 0);
    text("Some Text", 40, yOffset);
    makeInfoRect(xOffset, 1*yOffset+40, c1, c2, "Score");
    fill(255, 255, 0);
    text("Some Text", 40, 2*yOffset);
    makeInfoRect(xOffset, 2*yOffset+40, c1, c2, "Lives");
    fill(255, 255, 0);
    text("Some Text", 40, 3*yOffset );
    makeInfoRect(xOffset, 3*yOffset+40, c1, c2, "Enemies");
    fill(255, 255, 0);
    text("Some Text", 40, 4*yOffset );
    makeInfoRect(xOffset, 4*yOffset+40, c1, c2, "Highest");
    fill(255, 255, 0);
    text("Some Text", 40, 5*yOffset);
    //clock.display(new PVector(20, 100), 30);
    popMatrix();
  }
  void initClock() {
    clock = new Clock(new PVector(loc.x+75, loc.y+75), 50);
  }
  void makeInfoRect(int ox, int oy, color c1, color c2, String txt) {
    noStroke();
    fill(c1);//Shadow at partial opacity
    rect(ox, oy, 120, 120, 15);
    fill(c2);//rect color dark
    stroke(2);
    strokeWeight(4);
    //Button rectangle with border set at 2 pixels
    rect(ox, oy, 120, 120, 15);
    textSize(16);
    fill(220, 220, 30);
    text(txt, ox+30, oy+30 );
  }
} // end InfoArea class


//  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  Clock Class

class Clock {
  PVector loc;
  float handLength;
  float clockRadius;
  float clockTime, ellapsedTime;
  Clock(PVector location, float radius) {
    loc = location;
    clockRadius = radius;
    handLength = clockRadius;
    stroke(255);
    clockTime = 0;
    ellapsedTime = millis();
  }

  void display() {
    if (millis() - ellapsedTime >= 250) {
      clockTime++;
      ellapsedTime = millis();
    }
    // Display shadow
    fill(50, 50, 50, 150);
    noStroke();
    strokeWeight(6);
    ellipse(loc.x+8, loc.y+8, clockRadius*2+4, clockRadius*2+4);    

    // Display outer rim
    fill(100, 60, 180);
    stroke(5);
    strokeWeight(6);
    ellipse(loc.x, loc.y, clockRadius*2+4, clockRadius*2+4);
    // Fisplay face
    noStroke();
    fill(180, 180, 80);
    pushMatrix();
    imageMode(CENTER);
    translate(loc.x, loc.y);
    scale(1.8);
    image(clockImage, 20, 100);
    //ellipse(loc.x, loc.y, clockRadius*2-12, clockRadius*2-12);
    popMatrix();
    float s = map(clockTime, 0, 60, 0, TWO_PI) - HALF_PI;

    stroke(10, 50, 5);
    strokeWeight(4);
    line(loc.x, loc.y, loc.x + cos(s) * handLength*(.7), loc.y + sin(s) * handLength*(.7));
  }
}

