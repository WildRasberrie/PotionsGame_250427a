class Player {
  float x, y, size;
  boolean canCast;
  int ingredients;
  float opacity;


  Player (float x_, float y_, float size_) {
    x= x_;
    y= y_;
    size = size_;
    canCast = false ;
    ingredients = 0;
    opacity = 0;
    x=mouseX;
    y=mouseY;
  }

  void run () {
    display();
    update();
  }

  void display() {
    //setting up player
    fill (redCol);
    circle (mouseX, mouseY, size);
    text("Coords:\t"+mouseX+",\t"+mouseY, mouseX-100, mouseY-100);//debug
    playerRect();
  }

  void update() {

  }
  
  void playerRect(){
    fill(0);
    stroke(gold);
    strokeWeight(10);

    rect(width-330,48,222,369);
    fill (gold);
    circle(width-215,37,69);
    fill(0);
    textFont(ui.symbol);
    textSize (96);
    text("F",width-253,64);
  }
}
