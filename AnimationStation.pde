class AnimationStation {
  //variables
  PImage[] pixel;
  float speed;
  float scale;
  
  
  float index;
  boolean isZoominUp;
  boolean isZoominDown;
  boolean isZoominLeft;
  boolean isZoominRight;

//constructor
  AnimationStation(PImage[] deerImages, float deerSpeed, float deerScale){
    pixel = deerImages;
    speed = deerSpeed;
    scale = deerScale;
    
    index = 0;
    
    isZoominUp = false; 
    isZoominDown = false;
    isZoominLeft = false;
    isZoominRight = false;
  }
  
  //update current image
void rebirthDeer(){
  println(index);
  index += speed;
  
  if(index >= pixel.length){
    index = 0;
    isZoominUp = false;
    isZoominDown = false;
    isZoominLeft = false;
    isZoominRight = false;
    
  }
}
  
  //shows current image
void displayPixel(int x, int y){
  //imageMode(CENTER);
    if(isZoominUp){
    int i = int(index);
    PImage deerer = pixel[i];
    image(deerer, x, y, deerer.width*scale, deerer.height*scale);
    
    //keep animation going
    rebirthDeer();
  }else {
   PImage deerer = pixel[0];
   image(deerer, Deer.x, Deer.y, deerer.width*scale, deerer.height*scale);
  }
  
  if(isZoominDown){
    int i = int(index);
    PImage deerer2 = pixel[i];
    image(deerer2, x, y, deerer2.width*scale, deerer2.height*scale);
    
    //keep animation going
    rebirthDeer();
  }else {
   PImage deerer2 = pixel[0];
   image(deerer2, Deer.x, Deer.y, deerer2.width*scale, deerer2.height*scale);
  }
  
  if(isZoominLeft){
    int i = int(index);
    PImage deerer3 = pixel[i];
    image(deerer3, x, y, deerer3.width*scale, deerer3.height*scale);
    
    //keep animation going
    rebirthDeer();
  }else {
   PImage deerer3 = pixel[0];
   image(deerer3, Deer.x, Deer.y, deerer3.width*scale, deerer3.height*scale);
  }
  
  if(isZoominRight){
    int i = int(index);
    PImage deerer4 = pixel[i];
    image(deerer4, x, y, deerer4.width*scale, deerer4.height*scale);
    
    //keep animation going
    rebirthDeer();
  }else {
   PImage deerer4 = pixel[0];
   image(deerer4, Deer.x, Deer.y, deerer4.width*scale, deerer4.height*scale);
  }
}
}
