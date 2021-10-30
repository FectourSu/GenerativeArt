
float angle;

void setup(){
  size(1000, 1000);
  surface.setLocation(957, 0);
  noStroke();
  fill(0, 15, 30);
  rectMode(CENTER);
}


void draw(){
  background(255);
  
  float x = width;
  float dia = 110;
  int num = 100;
  
  translate(width / 2, height / 2);
  
  for (float i = 0; i < 360; i += 22.5){
    rotate(radians(i));
    
    pushMatrix();
    for (int j = 0; j < num; j++){
      scale(0.95);
      rotate(radians(angle/2)*j);
      ellipse(x, angle*j/0.03, dia, dia);
        angle += 0.003;

    }
    popMatrix();

    pushMatrix();
    for (int j = 0; j < num; j++){
      scale(0.95);
      rotate(-radians(angle*j)/2);
      ellipse(x, angle*j/0.03, dia, dia);
        angle -= 0.003;

    }
    popMatrix();
  }
  
  angle += 0.003;
  
  if(frameCount == 2000){
    exit();
  }
  saveFrame("output/image####.png");
}
