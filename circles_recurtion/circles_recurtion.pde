  float radA = 0.0, radB = 0.0;

  
   class RouteCircle {
   float placeX;
   float placeY;
   float diameter;
   float grad_start, grad_end;
   float sin;
   float arc_stroke_weight = 5;
   
   RouteCircle(float X, float Y) {
     placeX = X;
     placeY = Y;
     diameter = 0;
     grad_start = 0;
     grad_end = PI+QUARTER_PI;
     sin = 0.999;
   }
   
   boolean Bigger(float step){ // you mst add grades for start and end
     sin -= step;
     if (sin <= min_sin) return false;
     diameter = maxRad * cos(asin(sin));
     arc_stroke_weight -= 0.025;
     return true;
   }

  void display() {     
    //noFill();
    fill(255);
    strokeWeight(0.5);
    stroke(0);
    ellipse(placeX, placeY, diameter, diameter);
    //noFill();
    fill(0);
    strokeWeight(arc_stroke_weight);
    stroke(255);
    arc(placeX, placeY, diameter, diameter, grad_start, grad_end);
  }   
 }
 
 ArrayList<RouteCircle> circles = new ArrayList<RouteCircle>();
   float growing_step = 0.005;
   int birth_step = 5;
   int maxRad = 700;
   int birth_count = 0;

    int counter = 1;
    float min_sin = 0.1;
    int iteration;


void setup() {
  fill(255);
  size(1000, 700);
  //frameRate(20);
  smooth();
     circles.add(new RouteCircle(500, 350));
     
     //colour = !colour;
  
}

void draw() { /*
  double step = 0.1;
  double rad = 1;
  ellipse(500,350,(float)rad,(float)rad); 
  for (float i = 1 - 0.02; i >= 0.1; i -= 0.02) {
    rad = 700 * cos(asin(i));
    noFill();
    strokeWeight(0.1);
    ellipse(500,350,(float)rad,(float)rad);   
  }  */
  
 // rad = 100 * cos(asin(0.99));
 
  
  if ((birth_count % birth_step) == 0) {
    circles.add(new RouteCircle(500, 350));
    counter++; 
  }
     birth_count++;
    //colour = !colour;
  for (int i = 0; i < counter; i++) {
    if (!circles.get(i).Bigger(growing_step)) {
      circles.remove(i);
      print("Counter is", counter);
      counter--;
    }
    circles.get(i).display(); 
  } 
 }
 
