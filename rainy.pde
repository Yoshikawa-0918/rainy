class Rain{
  float x,y,speed;          //x座標,y座標,速度
  float diameter = 20;      //直径
  
  Rain(){}
  
  //初期化処理
  void init(){
    y = 0;
    xRandom = random(10,490);
    sRandom = random(6,12);
    
    x = xRandom;
    speed = sRandom;
  }
  
  //座標を更新する
  void update(){
    y += speed;
    if(y > height){
      init();
    }
  }
  
  //円を表示する
  void display(){
    fill(157,204,224);
    noStroke();
    ellipse(x,y,diameter/2,diameter);
  }
}

Rain[] rains = new Rain[100];
PImage img;
float xRandom;
float sRandom;

void setup(){
  size(500,700);
  img = loadImage("crowd.png");
  for(int i = 0; i < rains.length; i++){
    rains[i] = new Rain();
    rains[i].init();
  }
}

void draw(){
  background(0,0,50);
  for(int i = 0; i < rains.length; i++){
    rains[i].display();
    rains[i].update();
  }
  
  //雲の画像を描画
  image(img, -(width / 2), -(height / 5), width * 2,height/2);
}
