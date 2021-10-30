import queasycam.*;

PImage img;
QueasyCam cam;

void setup() {
  size(900, 900, P3D);
  img = loadImage("venus.jpg");
  img.resize(900, 900);
  
  
  cam = new QueasyCam(this);
  cam.speed = 5;              
  cam.sensitivity = 0.5;  
  
}

void draw() {
  background(#f1f1f1);
  fill(0);
  noStroke();
  sphereDetail(3);
  float tiles = 300;
  float tileSize = width/tiles;
  push();
  translate(width/2,height/2);

  for (int x = 0; x < tiles; x++) {
    for (int y = 0; y < tiles; y++) {
      color c = img.get(int(x*tileSize),int(y*tileSize));
      float b = map(brightness(c),0,255,1,0);
      float z = map(b,0,1,-150,150);
      
      push();
      translate(x*tileSize - width/2, y*tileSize - height/2, z);
      sphere(tileSize*b*0.8);
      pop();
    }
  }
  pop();
  /*
    if(frameCount == 2000){
    exit();
  }
  saveFrame("output/image####.png");*/
}
