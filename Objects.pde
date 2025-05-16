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
    collisions();
    potionMixing();
  }
}

void collisions() {

  for (int i = 0; i < 8; i++)
  {
    pickPotion = dist (mouseX, mouseY, objects[i].x, objects[i].y) < 100 && mousePressed;
    isHovering = dist (objects[i].x, objects[i].y, cauldron.x, cauldron.y)< cauldron.size/2;
    if (objects[i].tag == redPotion && isHovering) {
      red = true;
    }
    if (objects[i].tag == bluePotion && isHovering) {
      blue = true;
    }
    if (objects[i].tag == greenPotion && isHovering) {
      green = true;
    }
    if (objects[i].tag == yellowPotion && isHovering) {
      yellow = true;
    }
    if (objects[i].tag == apple && isHovering) {
      appleP = true;
    }
    if (objects[i].tag == feather && isHovering) {
      featherP = true;
    }
    if (objects[i].tag == cowPlant && isHovering) {
      cowplant = true;
    }
    if (objects[i].tag == purplePotion && isHovering) {
      purple = true;
    }
    // PVector lastPOS;

    lastPOS = new PVector (objects[i].x, objects[i].y);

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
        //make pot stir when Ingredient is added
        stirring.frame =(stirring.frame+1) % stirring.number;
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

void potionMixing() {
  for (int i =0; i < objects.length; i++) {

    boolean potion1 =appleP && blue && cowplant && player.ingredients==3;
    boolean potion2 = red && featherP &&  yellow && player.ingredients==3;
    boolean potion3 = green && purple && appleP && player.ingredients==3;

    print ("apple\t"+ (appleP));

    if (potion1||potion2||potion3) {
      playerSprite.playerPOS.x= width*2;
      transforming = true;
      player.ingredients=0;
    }
  }
}
