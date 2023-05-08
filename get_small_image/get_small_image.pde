
void setup(){
  
  size(800,600);
  
  PImage big = loadImage("dog.jpg");
  big.resize(0,height);  
  image(big,0,0);
  
  color c = big.get(200,300);  //两个参数，指定点位置横纵坐标
  fill(c);
  rect(500,50,100,100);
  
  PImage small = big.get(150,200,200,200);//后两个参数，是切出来的小图片的宽和高
  image(small,450,200);
}
