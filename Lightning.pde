int x=200;
int y=-20; 
int a=200;
int b=-20;

int curveX1=0;
int curveY1=0;
int curveX2=0;
int curveY2=0;

int g=0;

int winColor=180;

boolean bezier=false;

void setup(){
  size(400,400);
  background(0);
  stroke(255);
  strokeWeight(5);
}

void draw(){
  fill(0,0,30,40);
  noStroke();
  rect(0,0,400,400);
  buildings();
  
  //window coloring
  winColor+=5;
  if(winColor>180)
    winColor=180;
    
  //drawing windows
  for(int windY=290;windY<=420;windY+=25)
    for(int windX=-30;windX<=420;windX+=25)
      windows(windX,windY);      
  for(int windY=240;windY<=275;windY+=25)
    for(int windX=195;windX<=265;windX+=25)
      windows(windX,windY);    
  for(int windY=215;windY<=265;windY+=25)
    for(int windX=45;windX<=110;windX+=25)
      windows(windX,windY);   
  for(int windY=215;windY<=250;windY+=25)
    for(int windX=345;windX<=420;windX+=25)
      windows(windX,windY);      
  for(int windX=270;windX<=410;windX+=25)
    windows(windX,265);    
  for(int windX=-30;windX<=110;windX+=25)
    windows(windX,265);
}

void mousePressed(){
  fill(255,255,255,50);
  rect(0,0,400,400);
  lightning();
  buildings();
}

void keyPressed(){
 if (key=='b')
  bezier=true; 
}

void lightning(){
  winColor=-150;
  while(b<400){
    x=a;
    y=b; 
    curveX1=x-g;
    curveY1=y+15;
    curveX2=a+g;
    curveY2=b+15;
    stroke(255);
    a+=(int)(Math.random()*21)-10;
    g+=(int)(Math.random()*51)-25;
    noFill();
    if (bezier==false){
      b+=10;
      line(x,y,a,b);
    }
    if (bezier==true){
      b+=50;
      bezier(x,y,curveX1,curveY1,curveX2,curveY2,a,b);
    }
  }
  a=(int)(Math.random()*300)+50;
  b=-20;
  g=0;
  noStroke();
}

void buildings(){
  fill(0);
  noStroke();
  rect(0,250,35,200);
  rect(35,200,80,200);
  rect(110,275,75,200);
  rect(185,225,80,200);
  rect(260,250,75,200);
  rect(335,200,75,200);
}

void windows(int windX, int windY){
  fill(winColor,winColor,0);
  rect(windX,windY,10,15);
}
