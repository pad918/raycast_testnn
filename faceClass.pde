class face{
  PVector a = new PVector(10,5,10);
  PVector b = new PVector(10,0,0);;
  PVector c = new PVector(10,10,0);;
  face(PVector a1, PVector b1, PVector c1){
    a=a1;
    b=b1;
    c=c1;
  }
  float getIt(int dir, int punkt){
    if(punkt==1){
      if(dir==1){
        return a.x;
      }
      if(dir==2){
        return a.y;
      }
      if(dir==3){
        return a.z;
      }
    }
    
    if(punkt==2){
      if(dir==1){
        return b.x;
      }
      if(dir==2){
        return b.y;
      }
      if(dir==3){
        return b.z;
      }
    }
    
    if(punkt==3){
      if(dir==1){
        return c.x;
      }
      if(dir==2){
        return c.y;
      }
      if(dir==3){
        return c.z;
      }
    }
    return 0;
  }
  
  PVector p1(){
    return a;
  }
  PVector p2(){
    return b;
  }
  PVector p3(){
    return c;
  }

}
