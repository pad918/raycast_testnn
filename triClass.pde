class triangle{
  PVector p1, p2, p3; 
  triangle(PVector a, PVector b, PVector c){
    p1=a;
    p2=b;
    p3=c;
  }
  boolean testInside(PVector point){
    boolean test=false;
    float totArea=triArea(p1,p2,p3);
    float area2=triArea(point,p2,p3)+triArea(p1,point,p3)+triArea(p1,p2,point);
    //totArea*=1000000;
    //area2*=1000000;
    totArea=round(totArea);
    area2=round(area2);
    
    if(totArea==area2){
      //println("SKER!!!");
      test=true;
    }
    return test;
  }
  float triArea(PVector a, PVector b, PVector c){
    float area;
    area=(a.x*(b.y-c.y)+ b.x*(c.y-a.y)+c.x*(a.y-b.y))/2.0;  
    return abs(area);
  }
}
