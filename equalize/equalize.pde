import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import queasycam.*;
import processing.sound.*;

SoundFile song;


QueasyCam cam;
Minim minim;
AudioInput in;
BeatDetect beat;

void setup() {
  size(1000, 1000, P3D);
  
  //camera(width/2, height/2, 120.0, 50.0, 50.0, 12.0, 
  //    0, 1.0, 0);

  cam = new QueasyCam(this);
  cam.speed = 5;              
  cam.sensitivity = 0.5;  
  
  minim =  new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 1024);
  beat = new BeatDetect();
  beat.setSensitivity(400);
}

void draw() {
  beat.detect(in.mix);
  
  blendMode(NORMAL);
  background(0);
  
  perspective(PI/3.0, width/height, 20.0, 1000000.0);
  
  rotateY(0.04);
  rotateX(0.01);
  
  /*
  for (int i = 0; i < width; i++) {
    stroke(255, in.mix.get(i)*500);
    line(i , height/2+in.mix.get(i)*300, i, height/2-in.mix.get(i)*300);
  }*/
  hint(DISABLE_DEPTH_TEST);
  
  int total = 100;
  PVector[][] pp = new PVector[total][total];
  
  for(int i = 0; i < total; i++) {
    float lat = map(i, 0, total-1, 0, PI);
    
    for(int j = 0; j < total; j++) {
      float lon = map(j, 0, total - 1, -PI, PI);
      
      int imnd = i + j * total;
      float r = 200 + in.mix.get(imnd%1024)*100;
      
      float x = r * cos(lat) * cos(lon);
      float y = r * sin(lat) * cos(lon);
      float z = r * sin(lon);
      pp[i][j] = new PVector(x, y, z);

    }
  }
  
  blendMode(ADD);
  
  for (int i = 0; i < total - 1; i++){
    beginShape(TRIANGLE_STRIP);
    stroke(222, 50, 50, in.mix.get(i)*500);
    noFill();
    for (int j = 0; j < total; j++) {
      vertex(pp[i][j].x, pp[i][j].y, pp[i][j].z);
      vertex(pp[i+1][j].x, pp[i+1][j].y, pp[i+1][j].z);
    }
    endShape();
  }
  
  if (beat.isOnset()) background(255);

  /*if(frameCount == 700){
    exit();
  }
  saveFrame("output/image####.png");*/
}
