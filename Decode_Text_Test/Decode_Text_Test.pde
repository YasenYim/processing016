
PImage input;  //原始图片

void setup(){
  input=loadImage("Result.tif");
  
  String all="";  //解析出来的数组放在这里
  
  input.loadPixels();
  for(int i=0;i<input.pixels.length;i++){
    color c=input.pixels[i];
    float r=red(c)/2;    //在Encode代码里，为了图像明显，通道值乘以了2，这里要恢复回去
    float g=green(c)/2;
    float b=blue(c)/2;
    
          //这里的小技巧，用""隔开字符，拼接字符串；不分割开的话，程序会用加法把ascii编码加到一起。
    all+=char(int(r))+""+char(int(g))+""+char(int(b));  
  }
  
  PrintWriter output=createWriter("info.txt");
  output.println(all);
  output.flush();
  output.close();
  
  exit();
}
