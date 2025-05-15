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
  }

  void update() {
    collisions();
  }
  void collisions () {
    // PVector lastPOS;
    for (int i =0; i < objects.length; i++) {
      pickPotion = dist (mouseX, mouseY, objects[i].x, objects[i].y) < 100 && mousePressed;
      isHovering = dist (objects[i].x, objects[i].y, cauldron.x, cauldron.y)< cauldron.size;
      //  lastPOS = new PVector (objects[i].x, objects[i].y);
      if (pickPotion) {
        mouseReleased();
        objects[i].x=mouseX;
        objects[i].y=mouseY;
      }


      if (isHovering) {
        canDrop = true;
      } else {
        canDrop = false;
      }

      if (canDrop) {
        if (!grabbing) {
          magic.play();
          player.ingredients++;
          objects[i].x=  (width*2);
        } else stirring.frame= 0;
      }
    }
    
    if (player.ingredients>0 && mousePressed==false) {
      ui.opacity = 255;
      ui.text= player.ingredients;

      if (ui.text>2) {
        ui.text = 0;
      }
    } else {
      ui.opacity=0;
    }
  }
}
