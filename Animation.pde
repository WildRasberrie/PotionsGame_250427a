class Animation {
  PImage[] cauldron,playerSprite, transformation;
  int number;
  int frame;
  float x=300;
  float y=400;
      PVector playerPOS;

  Animation (String startImage, int number_) {
    playerPOS= new PVector (width-228,238);
    number=number_;
    cauldron=new PImage[number];
    playerSprite= new PImage [number];
    transformation = new PImage [number];
    for (int i =0; i<number; i++) {
      //use nf to format numbers into strings
      String Anims = startImage + i+".png";
      cauldron[i]=loadImage(Anims);
      playerSprite[i]=loadImage(Anims);
      transformation [i]=loadImage(Anims);
    }
  }

  void display() {
    frame =0;
    image(cauldron[frame], x, y,400,400);    
  }
  
  void spriteDisplay(){

    frame =(frame+1) % number;
    image (playerSprite[frame],playerPOS.x,playerPOS.y,600,600);
  }
  
  void transformDisplay(){
    frame =(frame+1) % number;
    image (transformation[frame],width-228,238,600,600);
  }
  
  int getWidth() {
    return cauldron[0].width;
  }
}
