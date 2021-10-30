let img;
let cnv;

function preload(){
  img = loadImage('assets/i.jpg');
}

function setup() {
  cnv = createCanvas(img.width, img.height);
  
  print(img.width, img.height);
  let newCanvasX = (windowWidth - img.width)/2;
  let newCanvasY = (windowHeight- img.height)/2;
  
  cnv.position(newCanvasX, newCanvasY);
  
  for(let col = 0; col < img.width; col+=1){
    for(let row = 0; row < img.height; row+=1){
      
      let xPos = col;
      let yPos = row;
      let c = img.get(xPos, yPos);
      
      push();
      
      translate(xPos, yPos);
      rotate(radians(random(360)));
      noFill();
      
      stroke(color(c));
      strokeWeight(random(3))
      point(sin(xPos)*random(60),sin(yPos)*random(140))
      strokeWeight(random(3));

      curve(xPos, yPos, sin(xPos)*random(60), cos(xPos)*sin(xPos)* random(90), random(10), random(80), cos(yPos) * sin(yPos)*random(140), cos(xPos)*sin(xPos)*50);
      
      pop();
      
    }
  }
}
