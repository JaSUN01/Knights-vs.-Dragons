class Arrow{
  
PVector   loc, vel, acc;
   boolean isDead;
   Arrow(PVector location, float angle){
     loc = location.get();
     angle += radians(180);
     isDead = false;
     vel = new PVector(cos(angle)*5  ,sin(angle)*5);
   }
   
   void run(){
     display();
     update();
     checkEdges();
   }
   
   
   void display(){
     fill(255, 23, 25);
     noStroke();
     ellipse(loc.x, loc.y, 8, 8 );
   }
   
   void update(){
     loc.add(vel);
   }
   
   void checkEdges(){
    if (loc.x < -20           || 
        loc.x > playAreaWidth ||
        loc.y < -20           || 
        loc.y > playAreaHeight) isDead = true;
   }
   
   boolean getIsDead(){
     return isDead;
   }

}
