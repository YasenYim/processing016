
String txt;
PFont font;

char ch;
int index;


void setup() {
  size(1920, 1080);

  String[]lines=loadStrings("过秦论.txt");
  println(lines.length);
  txt="";
  for (int i=0; i<lines.length; i++) {  //把文本里所有内容，拼接进txt这个字符串里
    txt+=lines[i];
  }
  
  txt=trim(txt);    //trim 可以修剪掉字符串里多余的空格
  println(txt.length());

  font=createFont("MSYH.TTC", 8);
  textFont(font);

  index=0;
  ch=txt.charAt(index);
  background(0);
}


void draw() {

  fill(255);

  float movement=dist(mouseX, mouseY, pmouseX, pmouseY);  //这一帧鼠标移动的距离
  
  if (mousePressed && movement>0) {          //如果鼠标按下，并且鼠标移动了

    textSize(movement);                    //用移动距离作为文字尺寸，鼠标越快，文字越大

    float angle=atan2(mouseY-pmouseY, mouseX-pmouseX);  //倾斜角度
    
    pushMatrix();
    translate(pmouseX, pmouseY);        //把坐标系挪到上一帧鼠标处，写文字
    rotate(angle);

    fill(255);
    ch=txt.charAt(index);
    text(ch, 0, 0);

    index++;
    if (index==txt.length())index=0;

    popMatrix();
  }
}

void keyPressed(){
  background(0);
}
