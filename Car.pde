class Car{
  //vars
  float x;
  float y;
  float w;
  float h;
  float speed;
  color c;
  
  //boundaries
  float topBound;
  float bottomBound;
  float leftBound;
  float rightBound;
  
  //constructor
  Car(float xPos, float yPos, float wPos, float hPos, float zoom, color cColor){
    x = xPos;
    y = yPos;
    w = wPos;
    h = hPos;
    speed = zoom;
    c = cColor;
    
    topBound = y;
    bottomBound = y + hPos;
    leftBound = x;
    rightBound = x + wPos;

  }
  /*
  //make evil cars
  void renderHonk(){
    fill(c);
    rect(x, y, w, h);
  }*/
  
  void renderHonk2(){
    fill(c);
    rect(x, y, w, h);
  }
  
  //cars now move and turn around
  void bounceZoom(){
    x = x + speed;
    leftBound =+ speed;
    rightBound =- speed;
  }
  
  void bounceZoom2(){
    x = x - speed;
    leftBound =- speed;
    rightBound =+ speed;
  }
  
  void carRebirth(){
     if(x > width){
       x = 0 - w;
     }
  }
  
  void carRebirth2(){
     if(x+w < 0){
       x = width;
     }
  }
}
  
