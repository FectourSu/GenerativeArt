int diaMin = 3010;
int diaMax = 3000;
int diaStep = 50;

float xx, yy, angle;

void setup(){
  size(1920, 1080);
  //surface.setLocation(987, 70);  
  
  noFill();
  stroke(255);
  strokeWeight(diaStep/4);
}

void draw(){
  background(255);
  
  blendMode(DIFFERENCE);
  
  xx = sin(radians(angle+90))*450;
  //yy = cos(radians(angle))*200;
  
  translate(width/2, height/2);
  for(float dia = diaMin; dia < diaMax; dia += diaStep){
    ellipse(-xx, 0, dia, dia);
    ellipse(xx, 0, dia, dia);
    //ellipse(width/2 - mouseX, 0, dia, dia);
  }
  
  //angle++;
  
  if(diaMin > 10) diaMin -= 2;
  if(frameCount>360) angle+=0.3;
   
  saveFrame("output/image####.png");
}
