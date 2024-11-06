class Balloon extends Starfield{
  Balloon() {
    mySpeed = 3;
    myY = (float)250;
    myX = (float)250;
    //myColor = color(255, 50,50);
  }
  void show(){
    strokeWeight(6);
    line((float)myX,(float) myY,(float) myX, (float)myY +100);
    strokeWeight(1);
    fill(myColor);
    ellipse((float)myX, (float)myY,75,90);
  }
  void move(){
    myY += -3;
  }
  void reset(){
    myX = mouseX;
    myY = mouseY;
    myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  }  
  
}
class Starfield {
  double myX, myY, myAngle, mySpeed,mySize,mod,mod2;
  int myColor;
  
  Starfield() {
    mod = (Math.random()*10) + 1.5;
    mod2 = (Math.random()*10) + 1.5;
    myX = 250;
    myY = -250;
    myAngle = (Math.random()*2)* Math.PI;
    mySpeed = (Math.random()*11)+5; 
    //mySize = (Math.random() * 20)+3;
    myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  }
  void move(){
    myX += Math.cos(myAngle) * mySpeed;
    myY += (Math.sin(myAngle) * mySpeed)+16;
  }
  void show(){
    fill(myColor);
    quad((float)myX -(float) mod, (float)myY -(float) mod,
       (float) myX + (float)mod2,(float) myY - (float)mod2,
       (float) myX +(float) mod, (float)myY + (float)mod,
       (float) myX - (float)mod2, (float)myY +(float)mod2);
   // ellipse((float)myX+300, (float)myY+50, (float)mySize,(float)mySize);
  }
  void reset(){
    myX = mouseX;
    myY = mouseY;
  }
  
}//end starfield class

Starfield [] star = new Starfield[100];
void setup(){
  size(500,500);
  for(int i = 1; i < star.length; i++){
    star[i] = new Starfield();
  }
  for(int i = 0; i < 1; i++){
    star[i] = new Balloon();
  }
}

void draw(){
  background(240,218,162);
  textAlign(CENTER);
  textSize(50);
  text("CONFETTI PARTY", 250, 100);
  textSize(30);
  text("(Click for more confetti)", 250, 150);
  for(int i = 0; i < star.length; i++){
    star[i].move();
    star[i].show();
  }


}

void mousePressed(){
   for(int i = 0; i < star.length; i++){
    star[i].reset();
   }
}
