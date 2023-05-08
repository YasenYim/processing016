PImage[]lightning;

PVector connect;
int picIndex=0;  //当前显示第几张图片

void setup() {
  size(1280, 960);
  lightning=new PImage[13];
  for (int i=0; i<lightning.length; i++) {
    lightning[i]=loadImage("Energy000"+i+".png");
    lightning[i].resize(108, 0);
  }
  connect=new PVector(0, 0);
  frameRate(30);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  connect.set(mouseX-width/2, mouseY-height/2);

  rotate(connect.heading());
  float scaleX=map(connect.mag(), 0, 100, 0, 1);
  scale(scaleX, scaleX>1?scaleX*0.5:scaleX);  
  //这里有个 A?B:C 结构，它相当于 if(A){B}else{C} 
  // 对的，scale 函数可以有两个参数，第一个是横轴缩放比例，第二个是纵轴缩放比例

  image(lightning[picIndex], 0, -lightning[picIndex].height/2);
  picIndex++;
  if (picIndex==lightning.length) {    //循环播放
    picIndex=0;
  }
}
