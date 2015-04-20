  float radA = 0.0, radB = 0.0;
  int counter = 0;
  
   class RouteCircle {
   float placeX;
   float placeY;
   float radA;
   float radB;
   int Color;
   
   RouteCircle(float X, float Y, boolean c) {
     placeX = X;
     placeY = Y;
     radA = 0;
     radB = 0;
     if (c) Color = 0;
     else Color = 255;
   }
   
   boolean Bigger(float step){
     radA += step;
     radB += step;
     if (radA >= maxRad) return false;
     return true;
   }

  void display() {
     fill(Color); 
     strokeWeight(weight);
    ellipse(placeX, placeY, radA, radB);
  }   
 }
 
 ArrayList<RouteCircle> circles = new ArrayList<RouteCircle>();
   boolean colour = false;
   float growing_step = 1;
   float birth_step = 15;
   int maxRad = 400;
   int birth_count = 0;
   float weight = 2;


void setup() {
  fill(255);
  size(480, 480);
  frameRate(40);
  smooth();
     circles.add(new RouteCircle(240, 240, colour));
     //colour = !colour;
  
}

void draw() {
  if ((birth_count % birth_step) == 0) {
    circles.add(new RouteCircle(240, 240, colour));
    counter++; 

  }
      birth_count++;
    //colour = !colour;
  for (int i = 0; i < counter; i++) {
    if (!circles.get(i).Bigger(growing_step)) {
      circles.remove(i);
      counter--;
    }
    circles.get(i).display();
  } 
 }
 
 void middle() {
   if ((birth_count % birth_step) == 0) {
    circles.add(new RouteCircle(240, 240, colour));
    counter++; 

  }
      birth_count++;
    //colour = !colour;
  for (int i = 0; i < counter; i++) {
    if (!circles.get(i).Bigger(growing_step)) {
      circles.remove(i);
      counter--;
    }
    circles.get(i).display();
  } 
 }
 
 void start() {
   
 }

