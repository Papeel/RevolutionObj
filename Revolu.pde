public class Point3D{
 int x;
 int y;
 int z;
 
 public Point3D(int x, int y){
   this.x = x;
   this.y = y;
 }
 
 public Point3D(int x, int y, int z){
   this.x = x;
   this.y = y;
   this.z = z;
 }
 
 public int getX(){
    return this.x; 
 }
 
 public int getY(){
    return this.y; 
 }
 
 public int getZ(){
    return this.z; 
 }
 
 
  
}

PShape obj;
boolean revu = false;
Point3D lastPoint;
ArrayList<Point3D> points;
void setup(){
 
 size(999,999,P3D);
 points =  new ArrayList();
  
}

void draw(){
  background(0);
  if(revu == false){
    stroke(255);
    line(500,0,500,height);
    if(points.size()>1){
      for(int i = 1; i< points.size(); i++){
         Point3D ini = points.get(i-1);
         Point3D fin = points.get(i);
         line(ini.getX(), ini.getY(),fin.getX(),fin.getY());
      }
    }
    
  }else{
    //translate (mouseX, mouseY) ; 
    shape(obj) ;
  }
  
}

void mouseClicked(){
  if(revu == false){
     points.add(new Point3D(mouseX,mouseY)); 
  }
  
}


void keyPressed(){
 if(keyCode == UP){
   revu = true; 
   obj = createShape();
    obj.beginShape(TRIANGLE_STRIP);
    obj.noFill() ;
    obj.stroke(255) ;
    obj.strokeWeight(2) ;
    ArrayList<Point3D> lastP =  new ArrayList();
    for(int i = 0; i< points.size(); i++){
         Point3D p = points.get(i);
         int xx = (int) (p.getX()*cos(8));
         int yy = (int) (p.getX()*sin(8));
         lastP.add(new Point3D(xx,p.getY(),yy));
         
     }
     
     for(int j = 0; j< 360; j= j + 8){
       for(int i = 0; i< points.size(); i++){
         Point3D p = points.get(i);
         if(points.size() != i+1){
           Point3D p1 = lastP.get(i);
           Point3D p2 = lastP.get(i+1);
           obj.vertex(p.getX(),p.getY(),p.getZ());
           obj.vertex(p1.getX(),p1.getY(),p1.getZ());
           obj.vertex(p2.getX(),p2.getY(),p2.getZ());
           
         }else{
           Point3D p1 = lastP.get(i);
           Point3D p2 = lastP.get(i-1);
           obj.vertex(p.getX(),p.getY(),p.getZ());
           obj.vertex(p1.getX(),p1.getY(),p1.getZ());
           obj.vertex(p2.getX(),p2.getY(),p2.getZ());
           
         }
       }
           
           
     }
     obj.endShape();
 }
  
}
