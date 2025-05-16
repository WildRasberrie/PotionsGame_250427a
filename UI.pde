class UI {
  PFont magicFont, scoreFont,add,symbol;
  PImage scroll;
  float x, y;
  int text, opacity;
  String[] goodText = {"Great Work!", "Couldn't do it better myself!", "What a quick learner you are!"};
  UI (float x, float y) {
    magicFont = loadFont ("DampfplatzSolid-Black-48.vlw");
    text = 0;
    add= loadFont("Cambria-Bold-48.vlw");
    symbol=loadFont("IntellectaHeraldics-48.vlw");
    this.x= x;
    this.y= y;
    opacity=0;
    scroll=loadImage("MagicList.png");
    scoreFont=loadFont("DampfplatzShadow-Black-48.vlw");
  }
  void run() {
    display();
    update();
  }
  void display() {
    textFont(magicFont);
    fill(gold, opacity);
    text(goodText[text], mouseX+50, mouseY-50);
  }

  void update () {
    score();
    magicScript();
  }

  void magicScript() {
    image(scroll, 879, height-480,619,588);
    textFont(magicFont);
    textSize(39);
    fill (0);
    text("Potion Making List", 723, height-552);
    
    textFont(symbol);
    textSize(90);
    text("x n x", 710, height-589);
    
    textSize(39);
    textFont(add);
    fill(redCol);
      text("+",773, height-491);
      text("+",870, height-489);
      text("+",778, height-417);
      text("+",869, height-418);
      text("+",797, height-352);
      text("+",883, height-352);

      text("=",960, height-483);
      text("=",955, height-411);
      text("=",954, height-338);

    
    //Ingredient List 
    
    //Ingredient 1
    image(potion[2],751, height-495,118,100);//blue potion
    image(potion[0],833, height-503,64,62);//cowplant
    image(potion[3],927, height-504,63,68);//apple
    //Ingredient 2
    image(potion[1],754, height-422,118,100);//red potion
    image(potion[7],836, height-428,70,70);//feather
    image(potion[5],930, height-421,118,100);//yellow potion
    //Ingredient 3
    image(potion[6],782, height-353,123,100);//green potion
    image(potion[4],935, height-353,123,100);//purple potion
    image(potion[3],858, height-362,70,70);//apple
    
  }

  void score() {
    textSize(36);
    textFont(scoreFont);
    fill(redCol);
    text ("Ingredients Used: \t" + player.ingredients, 100, 100);
  }
}
