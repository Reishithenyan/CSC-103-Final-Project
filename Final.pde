//import sound library
import processing.sound.*;
//declare variable to throw sound file in
SoundFile yeetSound;
SoundFile boingSound;
SoundFile chillSound;

//begin adding animations
PImage titleImage;
AnimationStation honk;
PImage[] pixelated = new PImage[6];
PImage[] pixelated2 = new PImage[6];
PImage honking;
PImage honking2;

//player and enemy
Player Deer;
ArrayList<Car> enemyList;
ArrayList<Car> enemyList2;

int switchVal;

int level;

boolean isPaused;


void setup(){
  size(800,600);
  isPaused = false;
  level = 1;
  
  //initialize sound variable
  yeetSound = new SoundFile(this, "yeet.wav");
  chillSound = new SoundFile(this, "awkward.wav");
  boingSound = new SoundFile(this, "boing.wav");
  
  //initialize animations/images
  titleImage = loadImage("title.png");
  honking = loadImage("Car1.png");
  honking2 = loadImage("truck(ow).png");
  for(int i = 0; i<pixelated.length; i++){
    pixelated[i] = loadImage("deerfront" +i+ ".png");
  }
  
  //player & enemies
  honk = new AnimationStation(pixelated, 0.2, 0.5);
  
  Deer = new Player(375, 495, 20, color(random(0,255),random(0,255),random(0,255)));
  enemyList = new ArrayList<Car>();
  enemyList2 = new ArrayList<Car>();
  switchVal = '0';
  
  //put cars into array
  //left to right cars
  enemyList.add(new Car(0, 318, 60, 25, 4, color(random(0,255),random(0,255),random(0,255))));
    enemyList.add(new Car(width/2, 318, 60, 25, 4, color(random(0,255),random(0,255),random(0,255))));
  enemyList.add(new Car(0, 358, 60, 25, 3, color(random(0,255),random(0,255),random(0,255))));
    enemyList.add(new Car(width/2, 358, 60, 25, 3, color(random(0,255),random(0,255),random(0,255))));
  enemyList.add(new Car(0, 398, 60, 30, 2, color(random(0,255),random(0,255),random(0,255))));
    enemyList.add(new Car(width/2, 398, 60, 25, 2, color(random(0,255),random(0,255),random(0,255))));
  enemyList.add(new Car(0, 438, 60, 25, 4, color(random(0,255),random(0,255),random(0,255))));
    enemyList.add(new Car(width/2, 438, 60, 25, 4, color(random(0,255),random(0,255),random(0,255))));
    
    //right to left cars
  enemyList2.add(new Car(width, 240, 60, 24, 4, color(random(0,255),random(0,255),random(0,255))));
    enemyList2.add(new Car(width/2, 240, 60, 24, 4, color(random(0,255),random(0,255),random(0,255))));
  enemyList2.add(new Car(width, 200, 60, 24, 3, color(random(0,255),random(0,255),random(0,255))));
    enemyList2.add(new Car(width/2, 200, 60, 24, 3, color(random(0,255),random(0,255),random(0,255))));
  enemyList2.add(new Car(width, 160, 60, 24, 2, color(random(0,255),random(0,255),random(0,255))));
    enemyList2.add(new Car(width/2, 160, 60, 24, 2, color(random(0,255),random(0,255),random(0,255))));
  enemyList2.add(new Car(width, 120, 60, 24, 4, color(random(0,255),random(0,255),random(0,255))));
    enemyList2.add(new Car(width/2, 120, 60, 24, 4, color(random(0,255),random(0,255),random(0,255))));
}

void draw(){
  switch(switchVal){
    case '0':
    background(0,0,0);
    image(titleImage, 40, 30, 720, 540);
    fill(255);
    textAlign(CENTER);
    textSize(18);
    text("ENTER = start", 405, 420);
    textSize(20);
    text("SHIFT = pause", 402, 450);
    textSize(20);
    text("ENTER = resume", 402, 480);
    textSize(20);
    text("BACKSPACE = reset", 401, 510);
    break;
  
    case '1':
    background(0, 255, 0);
    println(level);
    fill(100);
    rect(0,height-75, width, 75);
    //road
    fill(64);
    rect(0, 315, width, 160);
    fill(255, 255, 0);
    rect(0, 275, width, 40);
    fill(64);
    rect(0, 277, width, 36);
    fill(64);
    rect(0, 115, width, 160);
    fill(255, 255, 0);
    rect(0, 234, width, 2);
    fill(255, 255, 0);
    rect(0, 153, width, 40);
    fill(64);
    rect(0, 155, width, 36);
    fill(255, 255, 0);
    rect(0, 434, width, 2);
    fill(255, 255, 0);
    rect(0, 355, width, 40);
    fill(64);
    rect(0, 357, width, 36);
    
  
    textSize(32);
    fill(0,255,0);
    text("lives: " +Deer.life, 70, 570);
    //if sound not playing, play it
    if(!chillSound.isPlaying()){
      chillSound.play();
    }
    honk.displayPixel(Deer.x, Deer.y);
  
   //for every value in array, trigger function for said class
    for (Car cars : enemyList){
      image(honking, cars.x+15, cars.y-10, honking.width*1, honking.width*1);
      cars.bounceZoom();
      cars.carRebirth();
    //how to on collision detection
    if(Deer.y <= (cars.y + cars.h) && Deer.x <= (cars.x + cars.w)){
      if(Deer.y+Deer.size >= cars.y && Deer.x+Deer.size >= cars.x){
        //if sound playing, stop it
    if(yeetSound.isPlaying()){
      yeetSound.stop();
    }
    //play sound file else
      yeetSound.play();
      println("yeet");
        Deer.reBirth();
      }
    }
 }
 
    for (Car cars2 : enemyList2){
      image(honking2, cars2.x-10, cars2.y-15, honking2.width*1, honking2.width*1);
      //cars2.renderHonk2();
      cars2.bounceZoom2();
      cars2.carRebirth2();
    //how to on collision detection
    if(Deer.y <= (cars2.y + cars2.h) && Deer.x <= (cars2.x + cars2.w)){
      if(Deer.y+Deer.size >= cars2.y && Deer.x+Deer.size >= cars2.x){
        //if sound playing, stop it
    if(yeetSound.isPlaying()){
      yeetSound.stop();
    }
    //play sound file else
      yeetSound.play();
      println("yeet");
        Deer.reBirth();
      }
    }
 }
  
    if(Deer.life <= 0){
      switchVal = '2';
  }
  
    if(Deer.y < 0){
      switchVal = '3';
      level = level+1;
  }
  break;

  /*case '2':
  background(0, 255, 0);
  println(level);
  break;
  
  case '3':
  background(0, 255, 0);
  println(level);
  break;
  */

  case '2':
  background(0,0,0);
  textSize(40);
  fill(255);
  textAlign(CENTER);
  text("U DED SON", width/2, height/2);
  text("BACKSPACE or SHIFT to reset game", width/2, height/2 + 75);
  
  //reset reality function
  Deer.blackHole();
  level = 1;
  println(level);
  break;
  
  case '3':
  println(level);
  background(0,0,0);
  textSize(48);
  fill(255);
  text("One Step Closer To A Mate!", width/2, height/2 - 75);
  textSize(64);
  textAlign(CENTER);
  text("YAY!", width/2, height/2);
  text("BACKSPACE to title screen", width/2, height/2 + 75);
  //text("press 'L' for the next level", width/2, height/2 + 125);
  
  //level = level+1;
  //if(level == 2){
    //level = 3;
  //}
  println(level);
  
  //reset reality function
  Deer.blackHole();
  break;
  }
  }
  
  
  void keyPressed(){
    /*if(keyPressed == true){
        if(key == 'l'){
          if(switchVal == '5' && level == 2){
            switchVal = '2';
          }
          //else if(switchVal == '5' && level == 3){
           // switchVal = '3';
          //}
        }
      }*/
      //starts game, resumes game if paused on said level
    if(keyPressed == true){
        if(keyCode == ENTER){
          if(switchVal == '0'){
            if(level == 1){
          switchVal = '1';
            }
            //else if(level == 2){
             // switchVal = '2';
            //}
          }
        }
      }
      //pauses game if not on level complete screen 
      if(keyPressed == true){
        if(keyCode == SHIFT){
          if(switchVal != '3'){
          isPaused = true;
          switchVal = '0';
          }
        }
      }
      //resets entire game
      if(keyPressed == true){
        if(keyCode == BACKSPACE){
          switchVal = '0';
          level = 1;
          Deer.blackHole();
        }
      }
      
    
  if(keyPressed == true){
  if (key==CODED) {
    if (keyCode == LEFT) {
      honk.isZoominLeft = true;
      Deer.movingLeft = true;
      Deer.playerZoomLeft();
      //if sound playing, stop it
    if(boingSound.isPlaying()){
      boingSound.stop();
    }
    //play sound file else
      boingSound.play();
      println("boing");
    }
  }
  }
    
  if(keyPressed == true){
  if (key==CODED) {
    if (keyCode == RIGHT) {
      honk.isZoominRight = true;
      Deer.movingRight = true;
      Deer.playerZoomRight();
      //if sound playing, stop it
    if(boingSound.isPlaying()){
      boingSound.stop();
    }
    //play sound file else
      boingSound.play();
      println("boing");
    }
  }
  }
  
  if(keyPressed == true){
  if (key==CODED) {
    if (keyCode == UP) {
      honk.isZoominUp = true;
      Deer.movingUp = true;
      Deer.playerZoomUp();
      //if sound playing, stop it
    if(boingSound.isPlaying()){
      boingSound.stop();
    }
    //play sound file else
      boingSound.play();
      println("boing");
    }
  }
  }
  
  if(keyPressed == true){
  if (key==CODED) {
    if (keyCode == DOWN) {
      honk.isZoominDown = true;
      Deer.movingDown = true;
      Deer.playerZoomDown();
      //if sound playing, stop it
    if(boingSound.isPlaying()){
      boingSound.stop();
    }
    //play sound file else
      boingSound.play();
      println("boing");
    }
    }
    }
}

void keyReleased(){
  if (key==CODED) {
    if (keyCode == LEFT) {
      Deer.movingLeft = false;
    }
    if (keyCode == RIGHT) {
      Deer.movingRight = false;
    }
    if (keyCode == UP) {
      Deer.movingUp = false;
    }
    if (keyCode == DOWN) {
      Deer.movingDown = false;
    }
    }
}
