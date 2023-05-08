String single;  //全部文本拼接成一个长文本，放在这里

void setup() {
  
  //size(300,300);

  String[]str=loadStrings("test.txt");  //载入到数组里
  single="";    //最开始把字符串初始化为空
 
  for (int i=0; i<str.length; i++) {  //每一行拼接进去

    single+=str[i];
    single+="\n";  //每一行后面补一个回车，回车本身也算是一个字符
  }


  int dim=ceil(sqrt(single.length()/3));  //算出需要的图片尺寸
  println(dim);

  surface.setSize(dim,dim);  //根据尺寸设置窗口大小
  noLoop();
}


void draw(){  
  int index=0;  //要把长字符串里的字符挨个拿出来，这里是字符的编号，从0开始
  
  loadPixels();

  for (int i=0; i<pixels.length; i++) {  //遍历所有像素
  
    int r=int(single.charAt(index))*2;  //计算红色通道的值
    if (index<single.length()-1) {    //字符编号不要超过字符串长度
      index++;
    } else {
      break;        //万一越界，立刻终止像素遍历
    }
    
    int g=int(single.charAt(index))*2;  //绿色
    if (index<single.length()-1) {
      index++;
    } else {
      break;
    }
    
    int b=int(single.charAt(index))*2;    //蓝色
    if (index<single.length()-1) {
      index++;
    } else {
      break;
    }
    pixels[i]=color(r, g, b);
  }
  updatePixels();
  
  save("Result.tif");
}
