
Animation stirring;
color redCol = #FF1212, blueCol = #3412FF, lightPurp = #D17FD6, gold = #C6BA4C;
UI ui;
Player player;
boolean isHovering, pickPotion, canDrop, grabbing;
Objects[] objects;
PImage[] potion;
PVector imageSize;
float size=100;
String yellowPotion,greenPotion,purplePotion,cowPlant,apple,feather,redPotion,bluePotion;

void setup() {
  frameRate(20);
  size (1200, 1200);
  soundSetup();
  ui = new UI (width, height);
  player = new Player (width, height, 25.0);
  stirring= new Animation ("cauldron",10);
  imageSize= new PVector (250,250);
  potion= new PImage[8];

    potion[0]=loadImage("potions0.png");
    potion[1]=loadImage("potions1.png");
    potion[2]=loadImage("potions2.png");
    potion[3]=loadImage("potions3.png");
    potion[4]=loadImage("potions4.png");
    potion[5]=loadImage("potions5.png");
    potion[6]=loadImage("potions6.png");
    potion[7]=loadImage("potions7.png");
    
  objects = new Objects[8] ;
  //Set Potions to Tags
  objects[0]= new Objects(72, 311,size,cowPlant);
  objects[1]= new Objects(250, 215,size,redPotion);
  objects[2]= new Objects(420, 219,size,bluePotion);
  objects[3]= new Objects(564, 333,size,apple);
  objects[4]= new Objects(54, cauldron.y +104,size,purplePotion);
  objects[5]= new Objects(138, cauldron.y +242,size,yellowPotion);
  objects[6]= new Objects(445, cauldron.y +251,size,greenPotion);
  objects[7]= new Objects(561, cauldron.y +92,size,feather);

}
void draw() {
  background(255); 
  for (int i=0;i<objects.length;i++){
  objects[i].run();
  }
  loadImages();
  stirring.display();
  player.run();
  ui.run();
}

void mousePressed () {
  grabbing = true;
}


void mouseReleased() {
  grabbing = false;
  canDrop= false;
}

void loadImages(){
  imageMode(CENTER);
    image (potion[0], objects[0].x, objects[0].y,125,125);//cowplant
    image (potion[1], objects[1].x, objects[1].y,imageSize.x,imageSize.y);//red potion
    image (potion[2], objects[2].x, objects[2].y,imageSize.x,imageSize.y);//blue potion
    image (potion[3], objects[3].x, objects[3].y,125,125);//apple
    image (potion[4],objects[4].x, objects[4].y,imageSize.x,imageSize.y);//purple potion
    image (potion[5], objects[5].x, objects[5].y,imageSize.x,imageSize.y);//yellow potion
    image (potion[6], objects[6].x, objects[6].y,imageSize.x,imageSize.y);//green potion
    image (potion[7], objects[7].x, objects[7].y,125,125);//feather
}
