ArrayList<Circles> circles1 = new ArrayList<Circles>();
ArrayList<Circles> circles2 = new ArrayList<Circles>();

//ArrayList<Image_Brushes> draw_pngs = new ArrayList<Image_Brushes>();

//PImage[] imgs = new PImage[2];
//int pic_index = 0;

int brush = 0;
int draw_png = 0;

boolean bStart = false;
PFont f;

boolean mirror = false;

int number;

//-------------------------------------------
void setup() {
  size(1000, 600, P2D);
  
  f = createFont("Arial", 16, true);
  
  //imgs[0] = loadImage("touch.png");
  //imgs[1] = loadImage("sight.png");
  //for (int i = 0; i < 2; i++) {
  //  imgs[i].resize(imgs[i].width/3, imgs[i].height/3);
  //  }
  }


//-------------------------------------------
void draw_splash_screen() {
  background(255);
}

//-------------------------------------------  
void draw() {  
  if (bStart == false) {
    draw_splash_screen();
    textFont (f, 10);
    fill(255, 0, 255);
    text("Z's Rorschach Sketcher \nWelcome \nClick mouse to begin.", width*0.5, height*0.5);
  }
    
    else if (bStart == true) {
      background(0);
      String s = "Drag mouse to draw. \nPress '1', '2' to change colour \nPress 'm' to mirror \nPress'n' to return to normal \nPress 'z' to clear 1 circle set \nPress 'x' to clear 2 colour set \nPress 's' to save image";
      textFont(f, 10);
      fill(255);
      text(s, 20, 450, 200, 200);
  
  for (int i = 0; i < circles1.size(); i++) {
    Circles circle = circles1.get(i);
    circle.update();
    circle.draw();
    }

  for (int i = 0; i < circles2.size(); i++) {
    Circles circle = circles2.get(i);
    circle.update();
    circle.draw();
    }
  
   //for (int i = 0; i < draw_pngs.size(); i++) {
   // Image_Brushes draw_png = draw_pngs.get(i);
   // float norm_length = map(i, 0, draw_pngs.size(), 0.0, 1.0);
   // float lfo = map(norm_length*sin(frameCount*0.02), -1.0, 1.0, 0.0, 1.0);
   // draw_png.set_size(lfo);
   // draw_png.set_rot_speed(lfo*1.25);
   // draw_png.draw();
   //     }
      }
    
    if (mirror == true){
      flipHalf();
    }
}

  
//-------------------------------------------
void mousePressed() {
  bStart = true;
  }

//-------------------------------------------
void mouseDragged() {  
  if (brush == 0) {
    circles1.add(new Circles(mouseX, mouseY, frameCount%255, 0, 255-(frameCount%180), 80));
  } else if (brush == 1) {
    circles2.add(new Circles(mouseX, mouseY, 255, 150, frameCount%255, 150));
  }
  // else if (draw_png == 0) {
  //draw_pngs.add(new Image_Brushes(imgs[pic_index], mouseX, mouseY));
  //} else if (draw_png == 1) {
  //draw_pngs.add(new Image_Brushes(imgs[pic_index], mouseX, mouseY));
  //}
}



//-------------------------------------------
void flipHalf() {
  if (mirror == true){
  loadPixels();
  for(int x=width/2; x<width; x++) {
    for (int y=0; y<height; y++){
      pixels[x+y*width] = pixels[(width-x)+y*width];
    }
   }
    updatePixels();
  }
}

//-------------------------------------------
void keyPressed() {
  if (key == 'z') {
    circles1.clear();
  }
  if (key == 'x') {
    circles2.clear();
  }
  if (key == '1') {
    brush = 0;
  }
  if (key == '2') {
    brush = 1;
  }
  if (key == 'm') {
    mirror = true;
  } 
  if (key == 'n') {
    mirror = false;
  }
  if (key == 's') {
  saveFrame("data/drawing" + nf(number, 3) + ".png");  
  number++;  
  }
  //if (key == 'c') {
  //  draw_pngs.clear();
  //}
  //if (key == '9') pic_index = 0; {
  //  draw_png = 0;
  //}
  //if (key == '0') pic_index = 1; {
  //draw_png = 1;
  //}
  
}