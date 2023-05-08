PrintWriter output;  //打印器

void setup() {
  size(800,600);
  // 创建txt 文档
  output = createWriter("positions.txt"); 
}

void draw() {
  
  strokeWeight(3);
  point(mouseX, mouseY);
  
  output.print(mouseX);    //print 打完之后不换行
  output.print(", ");
  output.println(mouseY);  //println 会在内容后面加一个回车
}

void keyPressed() {
  output.flush();  // Writes the remaining data to the file
  output.close();  // Finishes the file
  
}
