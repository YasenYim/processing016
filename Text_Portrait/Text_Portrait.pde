
String txt;  //文字都拼合成一个超长的字符串
PImage pic;  //底图

void setup() {
  size(1200, 1200);

  String[]lines=loadStrings("百年孤独.txt");
  txt="";
  for (int i=0; i<lines.length; i++) {    //拼合成长字符串
    txt+=lines[i];
  }

  println(txt.length());

  pic=loadImage("bw2.jpg");
  pic.resize(width, height);

  PFont font=createFont("MSYH.TTC", 30);
  textFont(font);
  textAlign(LEFT, BOTTOM);
  textSize(10);
  fill(0);

  int space=10;  //行间距
  int index=0;    //字符串中用的字符的编号
                  //这里行与行之间是等距的，但每一行里相邻字符的距离是根据图片计算的。
  
  for (int y=space; y<height+space; y+=space*1) {

    float x=0;
    while (x<width) {    //每行虽然宽度相同，但包含的字符数不同，所以要用while循环
      color c=pic.get(int(x), y);
      float bright=brightness(c);
      float txtSize=map(bright, 0, 255, space*1.4, space*0.1);
      char ch=txt.charAt(index);
      
      textSize(txtSize);      
      float wd=textWidth(ch);    //设定textSize之后，textWidth告诉你这个字符的宽度
      
      text(ch, x, y);
      index++;        //字符串里正在使用的这个字符的坐标
      if (index==txt.length())index=0;      
      x+=wd;
    }
  }

  save("text portrait.jpg");
}
