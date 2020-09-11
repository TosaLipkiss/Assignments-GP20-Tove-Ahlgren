//variables
boolean showCursor=false;
float cursorX=104;
float cursorY=166;
int textCount=0;
//timer on frames
int timer=0;
int timerFlip=0;

void setup()
{
  frameRate(30);
  size(768, 432);
  stroke(0,220,0);
  strokeCap(PROJECT);
}

// Lipkiss
void draw()
{
  translate(104,166);
  background(0, 0, 0);
  fill(0, 0, 0);
  name();
  Cursor();
  //move cursor or stop cursor.
  if (timer == 60)
  {
    //move forward condition depending on how many characters written.
    if(textCount < 7)
    {
    cursorX+=80;
    timer=0;
    textCount++;
    }
  }
  //blinking cursor
  if(timerFlip == 10)
  {
    showCursor = !showCursor;
    timerFlip=0;
  }
  timer++;
  timerFlip++;
}

//Characters in methods.
void L()
{
  line(10,100,10,10);
  line(50,100,10,100);
}
void I()
{
  line(30,40,30,100);
  line(15,39,30,39);
  line(30,10,30,10);
  line(10,100,50,100);
}
void P()
{
  line(10,140,10,40);
  arc(31,76,40,50,-4.0,1.7);
}
void K()
{
  line(10,100,10,10);
  line(46,44,16,70);
  line(46,96,32,59);
  line(50,35,50,36);
  line(50,100,50,98);
}
void S()
{
  line(45,32,37,32);
  line(20,100,15,100);
  arc(28,49.1,35,34,39.4,42.4,0);
  arc(32,84,35,34,67.7,70.7,0);
}

//TextCursor " | "
void Cursor()
{
  if (showCursor == true)
  {
     strokeWeight(10);
     resetMatrix();
     translate(cursorX,cursorY);
     line(10,110,10,-10);
  }
}
//write text using Character methods.
void name()
{
  strokeWeight(20);
  if (textCount >= 1)
  {
    L();
  }
  if (textCount >= 2)
  {
    translate(80,0);
    I();
  }
  if (textCount >= 3)
  {
    translate(80,0);
    P();
  }
  if (textCount >= 4)
  {
    translate(80,0);
    K();
  }
  if (textCount >= 5)
  {
    translate(80,0);
    I();
  }
  if (textCount >= 6)
  {
    translate(80,0);
    S();
  }
  if (textCount >= 7)
  {
    translate(80,0);
    S();
  }
}
