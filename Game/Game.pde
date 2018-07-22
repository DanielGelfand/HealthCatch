PImage basket;
PImage vegetable;
PImage cheesePuff;
int score= 0;

//Instantiate objects
Bowl catcher = new Bowl();
Healthy kale = new Healthy();
Bad puff = new Bad();


//Initial setup
void setup(){
  size(600,600);
  basket = loadImage("basket.png");
  vegetable = loadImage("Kale.png");
  cheesePuff = loadImage("cheesePuff.png");
}

//Displays and runs the game
void draw(){
  clear();
  textSize(24);
  background(132,112,255);
if(kale.y > 550 || isContact(kale,catcher)){
    kale.x = ((int) random(500) / 50) * 50;
    kale.y = 0;
}
if(puff.y > 550 || isContact(puff,catcher)){
    puff.x = ((int) random(500) / 50) * 50;
    puff.y = 0;
}
  catcher.display();
  kale.display();
  puff.display();
  kale.updatePos();
  puff.updatePos();
  if(score < 0){
   noLoop();
   textAlign(CENTER, CENTER);
   text("GAME OVER!",300,300);
 }
 
 if(score >= 20){
   noLoop();
   textAlign(CENTER, CENTER);
   text("YOU WIN HEALTHY HUMAN!",300,300);
 } 
 
//println("Score: " + score);

text("score: " + score, 50,50);
}

//keyboard input used to move the bowl
void keyPressed() {

    if (key=='d'  && (catcher.x<500) ) {
      //println("pressed d");
      catcher.x += 60;
    }
    
    else if(key=='a' && (catcher.x>70) ){
     catcher.x -= 60; 
    }
    
}

//Checks if there is contact between Food and Bowl
public boolean isContact(Food i, Bowl b){
  
  if( (abs(i.y-b.y)<50) && (abs(b.x -i.x) < 50)){
    if(i instanceof Healthy)
      score+=1;
    else
      score-=1;
    return true;
  }
  
  return false;
  
  
}



class Bowl{
  
  int x;
  int y;
  
  public Bowl(){
   x=270;
   y=500;
  }
  
  
  public void display(){
   image(basket,x,y,70,70);
  }
  
}

public abstract class Food{
  int x;
  int y;
  
  
  public void updatePos(){
   y+=7;
  }
  
}


class Healthy extends Food{
  
  public Healthy(){
    x = ((int) random(500) / 50) * 50;
    y = 0;
  }
   public void display() {
    image(vegetable, x, y , 50, 50);
  }
  
}

class Bad extends Food{
  
  public Bad(){
    x = ((int) random(500) / 50) * 50;
    y = 0;
  }
   public void display() {
    image(cheesePuff, x, y , 50, 50);
  }
  
}
