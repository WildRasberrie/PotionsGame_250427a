Cauldron cauldron;
boolean red, blue, green, yellow, appleP, featherP, cowplant, purple;
class Objects {
  float x, y, size;
  String tag;
  PImage potion;
  PVector imageSize;
  Objects (float x_, float y_, float size_, String tag_) {
    this.x= x_;
    this.y=y_;
    size = size_;
    tag=tag_;
    cauldron  = new Cauldron (300, 400, 100);
  }

  void run () {
    display();
    update();
    cauldron.run();
  }
  void display() {
    noStroke();
    fill(blueCol, 0);
    circle (x, y, size);
  }
  void update() {
  }
}


class Cauldron {
  float x, y, size;
  color fill_;
  Cauldron (float x_, float y_, float size_) {
    x=x_;
    y=y_;
    size = size_;
    fill_ = 180;
  }
  void run () {
    display();
    update();
  }
  void display() {
    fill(fill_);
    circle (x, y, size);
  }
  void update() {
    potionMixes();
    potionMixing();

  } 
}

 void potionMixes(){
    
    for (int i = 0; i < 8; i++)
    {
      if (objects[i].tag == redPotion && pickPotion) {
        red = true;
      }
      if (objects[i].tag == bluePotion && pickPotion) {
        blue = true;
      }
      if (objects[i].tag == greenPotion && pickPotion) {
        green = true;
      }
      if (objects[i].tag == yellowPotion && pickPotion) {
        yellow = true;
      } 
      if (objects[i].tag == apple && pickPotion) {
        appleP = true;
      } 
      if (objects[i].tag == feather && pickPotion) {
        featherP = true;
      } 
      if (objects[i].tag == cowPlant && pickPotion) {
        cowplant = true;
      } 
      if (objects[i].tag == purplePotion && pickPotion) {
        purple = true;
      } 
    }
  }
  
    void potionMixing() {
    for (int i =0; i < objects.length; i++) {
      
      boolean potion1 =appleP && blue && cowplant && canDrop && !grabbing;
      boolean potion2 = red && featherP &&  yellow;
      boolean potion3 = green && purple && appleP;
     
      print ("apple\t"+ (appleP));
      
      if (potion1){
         player.ingredients=0;
          
      }
      
       if (potion2){
         player.ingredients=0;
          
      }
      
       if (potion3){
        
           player.ingredients=0;
      }
    }
  }
