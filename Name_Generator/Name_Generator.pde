

String[]adj1={"反社会", "液态", "高科技", "社恐", "麻风病", "爆浆", "软绵绵"};
String[]adj2={"虚构", "病娇", "飞行", "进化", "暴躁", "电音", "放射性"};
String[]noun={"污渍", "机器人", "软糖", "少先队员", "少女", "小猫咪", "废物"};

PFont font;

void setup() {
  size(720, 400);

  font=createFont("MSYH.TTC", 64);
  textAlign(CENTER, CENTER);
  textFont(font);
  generateNewName();
}

void draw() {

  if (frameCount%60==0) {  //每隔60帧，切换一次
    generateNewName();
  }
}

void mousePressed() {
  generateNewName();
}

void generateNewName() {
  background(127);

  int index=int(random(adj1.length));
  String first=adj1[index];

  index=int(random(adj2.length));
  String second=adj2[index];

  index=int(random(noun.length));
  String third=noun[index];

  String name = first+second+third;

  text(name, width/2, height/2);
}
