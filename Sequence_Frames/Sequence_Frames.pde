
PImage pic;

PImage[]step;
int index=0;    //当前显示在窗口里的图片在数组里的编号

void setup() {
  size(800, 500);

  pic=loadImage("iori必杀技2.png");
  int wd=pic.width/5;
  int ht=pic.height/4;


  step=new PImage[20];
  for (int i=0; i<20; i++) {
    int x=i/4;
    int y=i%4;
    step[i]=pic.get(x*wd, y*ht, wd, ht);  //左上顶点x,y，小图片的宽和高
  }
}


void draw() {
  
  if (frameCount%4==0) {
    background(255);
    
    scale(2);
    image(step[index], 0,00);
    
    index++;
    if (index==20)index=0 ;
  }
}
