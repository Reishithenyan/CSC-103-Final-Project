class Player{
  //vars
  int x;
  int y;
  int size;
  color c;
  int jumpSpeed;
  int sideSpeed;
  int life;
  //int fallSpeed;
  
  //boundaries
  int topBound;
  int bottomBound;
  int leftBound;
  int rightBound;
  
  boolean movingLeft;
  boolean movingRight;
  boolean movingUp;
  boolean movingDown;
  //int peakY;
  
  //constructor
  Player(int xPos, int yPos, int pSize, color pColor){
  x = xPos;
  y = yPos;
  size = pSize;
  c = pColor;
  jumpSpeed = 10;
  sideSpeed = 10;
  life = 5;
  
  topBound = y;
  bottomBound = y + size;
  leftBound = x;
  rightBound = x + size;
  
  movingLeft = false;
  movingRight = false;
  movingUp = false;
  movingDown = false;
  }
  
  //make player
  void render(){
    fill(c);
    square(x,y,size);
  }
  
  //moves player in direction stated by the boolean
  void playerZoomRight(){
    if(movingRight == true){
      if(x+size < width){
      x = x + sideSpeed;
      rightBound += sideSpeed;
      leftBound += sideSpeed;
      println("rightbound " +rightBound);
       println("leftbound " +leftBound);
      } 
    }
  }
  void playerZoomLeft(){
    if(movingLeft == true){
      if(x > 0){
      x = x - sideSpeed;
      leftBound -= sideSpeed;
      rightBound -= sideSpeed;
      println("rightbound " +rightBound);
       println("leftbound " +leftBound);
      }
    }
  }
  void playerZoomUp(){
    if(movingUp == true){
      if(y > 0){
      y = y - jumpSpeed;
      topBound -= jumpSpeed;
      bottomBound -= jumpSpeed;
      println("topbound " +topBound);
       println("bottombound " +bottomBound);
      }
    }
  }
  void playerZoomDown(){
    if(movingDown == true){
      if(y+size < height-75){
      y = y + jumpSpeed;
      bottomBound += jumpSpeed;
      topBound += jumpSpeed;
      println("topbound " +topBound);
       println("bottombound " +bottomBound);
      } //else 
    }
  }

  //reset player if they are hit
  void reBirth(){
      x = 375;
      y = 495;
      size = 30;
      c = color(random(0,255),random(0,255),random(0,255));
      println("oof");
      life = life - 1;
  }
  
  //reset everything
  void blackHole(){
    x = 375;
    y = 495;
    size = 30;
    c = color(random(0,255),random(0,255),random(0,255));
    life = 5;
  }
}
