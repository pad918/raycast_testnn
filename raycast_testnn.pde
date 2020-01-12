// Vektorer
PVector CameraPos;
PVector CameraRot;
PVector BoxPos;
PVector BoxSize;
//

//variabler man kan ändra
int renderDist=200;
int maxTid=200;
float degPPixel = 0.2;
int fov=100; // Mer är mindre, tvärtom 
//

int pos;
float raySpeed;
//Pimages
PImage render;
//
face face1 = new face(new PVector(100, 0, 0), new PVector(100, 100, 0), new PVector(100, 0, 100));

void setup() {
  render = createImage(width,height,RGB);
  CameraPos = new PVector(-13,-9,20);
  BoxPos = new PVector(-10,0,-10);
  BoxSize = new PVector(10,10,10);
  CameraRot= new PVector(0.16,0.29,0);
  size(1000,1000);
  background(0);
  noStroke();
  fill(255);
  frameRate(1000);
  
}

void draw(){
  raySpeed = renderDist/maxTid; // rednerDist kan ändras, då ändras sammtidigt finheten
  Tracer();
  image(render,0,0);
  
  if(keyCode == UP){
   CameraPos.add(0,-0.1,0);
   println("UP!!");
 } 
 if(keyCode == RIGHT){
   CameraPos.add(-0.1,0,0);
   println("UP!!");
 } 
 if(keyCode == LEFT){
   CameraPos.add(0.1,0,0);
   println("UP!!");
 } 
 if(keyCode == DOWN){
   CameraPos.add(0,0.1,0);
   println("DOWN!!");
 } 
  
}
void keyPressed() {
  println(keyCode);
 
 if(keyCode == 87){
   CameraRot.add(0,-0.01,0);
   println("DOWN!!");
 } 
 if(keyCode == 83){
   CameraRot.add(0,0.01,0);
   println("DOWN!!");
 }
 if(keyCode == 65){
   CameraRot.add(-0.01,0,0);
   println("DOWN!!");
 } 
 if(keyCode == 68){
   CameraRot.add(0.01,0,0);
   println("DOWN!!");
 }
 if(keyCode == 81){
   CameraPos.add(0,0,-0.1);
   println("DOWN!!");
 } 
 if(keyCode == 69){
   CameraPos.add(0,0,0.1);
   println("DOWN!!");
 }
 println(CameraPos);
 println(CameraRot);
}
void Tracer(){
  //NYA
  
  triangle tri1;
      PVector p1=face1.p1().copy();
      //println("TYVÄRR =/");
      //println(p1);
      PVector p2=face1.p2().copy();
      PVector p3=face1.p3().copy();
      p1.sub(CameraPos);
      p2.sub(CameraPos);
      p3.sub(CameraPos);
      p1.normalize();
      p2.normalize();
      p3.normalize();
      //p1.add(cameraRot);
      //p2.add(cameraRot);
      //p3.add(cameraRot);
      p1.normalize();
      p2.normalize();
      p3.normalize();
      
      PVector pos1, pos2, pos3;
      pos1=p1.copy();
      pos2=p2.copy();
      pos3=p3.copy();
      
      pos1.x=(p1.x*CameraRot.x);
      pos1.y=(p1.y*CameraRot.y);
      pos2.x=(p2.x*CameraRot.x);
      pos2.y=(p2.y*CameraRot.y);
      pos3.x=(p3.x*CameraRot.x);
      pos3.y=(p3.y*CameraRot.y);
      println("NEW");
      println(pos1);
      println(pos2);
      println(pos3);
      tri1 = new triangle(pos1, pos2, pos3);
      triangle tri2;
      tri2 = new triangle(new PVector(0,0,0),new PVector(0,100,0),new PVector(100,0,0));
  
  // /nya
  render.loadPixels();
  for(float x=0; x<width; x++){
    for(float y=0; y<height; y++){
      PVector dir;
      pos=int(y*width+x);
      render.pixels[pos] = color(0,0,0);
      dir = new PVector(((-width/2)+x)*degPPixel, (-1*((-height/2)+y)*degPPixel),fov);
      //CameraRot.normalize();
      dir.normalize();
      dir.set(CameraRot.x-dir.x, CameraRot.y-dir.y, CameraRot.z-dir.z);
      
      PVector ray;
      ray = CameraPos.copy();
      dir.mult(raySpeed);
      for(int t=0; t<maxTid; t++){
        ray.add(dir);
        if(ray.x>BoxPos.x && ray.y>BoxPos.y && ray.x<(BoxPos.x + BoxSize.x) && ray.y<(BoxPos.y+BoxSize.y) && ray.z>BoxPos.z && ray.z < (BoxPos.z + BoxSize.z)){
          render.pixels[pos] = color(255,0,0);
          break;
        }

      }
    }
  }
  render.updatePixels();
}
