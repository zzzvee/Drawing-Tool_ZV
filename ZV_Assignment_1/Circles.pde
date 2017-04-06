class Circles {
  int x;
  int y;
  int radius;
  int max_size = 150;

  int r, g, b, a;

  Circles(int _x, int _y, int _r, int _g, int _b, int _a) {
    x = _x;
    y = _y;
    r = _r;
    g = _g; 
    b = _b;
    a = _a;
    radius = 2;
  }
  
  //increase circle size
  void update() {
    radius++;
  }


  void draw() {
    noFill();
    stroke(r, g, b, a);
    ellipse(x, y, radius%max_size, radius%max_size);
  }
}