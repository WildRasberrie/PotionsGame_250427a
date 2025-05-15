class Animation {
  PImage[] cauldron;
  int number;
  int frame;
  float x=300;
  float y=400;

  Animation (String startImage, int number_) {
    number=number_;
    cauldron=new PImage[number];
    for (int i =0; i<number; i++) {
      //use nf to format numbers into strings
      String Anims = startImage + nf(i)+".png";
      cauldron[i]=loadImage(Anims);
    }
  }

  void display() {
    frame =(frame+1) % number;
    image(cauldron[frame], x, y,400,400);
  }

  int getWidth() {
    return cauldron[0].width;
  }
}
