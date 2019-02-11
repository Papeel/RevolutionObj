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
 public void setX(int x){
    this.x = x; 
 }
 public void setY(int y){
    this.y = y; 
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

ArrayList<Point3D> points;
void reset(){
   points = new ArrayList();
  revu = false;
}
void setup(){
 
 size(999,999,P3D);
 points =  new ArrayList();
  
}

void draw(){
  background(0);
  textSize(26);
  text ("Press Q to reset" , 20, 25) ;
  if(revu == false){
    textSize(30);
    text ("Dibuje en la parte derecha.\n\nPulse 'UP' para la revolución" , 20, 500) ;
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
    translate (mouseX, mouseY) ; 
    shape(obj) ;
  }
  
}

void mouseClicked(){
  if(revu == false && revu==false){
    if(mouseX<500)return;
     points.add(new Point3D(mouseX,mouseY)); 
  }
  
}


void keyPressed(){
 if(keyCode == UP && revu == false){
   float rad = 8*3.141592/180;
   revu = true; 
   obj = createShape();
    obj.beginShape(TRIANGLE_STRIP);
    obj.fill(255,0,0) ;
    obj.stroke(255) ;
    obj.strokeWeight(2) ;
    
   
    for(int i = 0; i< points.size(); i++){
         Point3D p = points.get(i);
         p.setX(p.getX()-500);
         p.setY(p.getY()-500);
         
     }
     
     
     for(int i = 1; i< points.size(); i++){
         Point3D p1 = points.get(i-1);
         Point3D p2 = points.get(i);
         obj.vertex(p1.getX(),p1.getY(),p1.getZ());
         obj.vertex(p2.getX(),p2.getY(),p2.getZ()); 
         for(int j = 0; j<= 360; j= j + 8){
           rad = (j+8)*3.141592/180;
           int xx1 = (int) (p1.getX()*cos(rad)-p1.getZ()*sin(rad));
           int zz1 = (int) (p1.getX()*sin(rad) + p1.getZ()*cos(rad));
           int xx2 = (int) (p2.getX()*cos(rad)-p2.getZ()*sin(rad));
           int zz2 = (int) (p2.getX()*sin(rad) + p2.getZ()*cos(rad));
           obj.vertex(xx1,p1.getY(),zz1);
           obj.vertex(xx2,p2.getY(),zz2);
         }
         
     }
           
           
     
     obj.endShape();
 }else if(key == 'q' || key =='Q'){
    reset(); 
 }
  
}
