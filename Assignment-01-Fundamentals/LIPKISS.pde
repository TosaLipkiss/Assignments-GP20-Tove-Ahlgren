boolean textCursor=false;

void setup()
{
  frameRate(1);
  size(768, 432);
  stroke(0,220,0);
  strokeWeight(20);
  strokeCap(PROJECT);
}
// Lipkiss
void draw()
{
  textCursor = !textCursor;
  background(0, 0, 0);
  fill(0, 0, 0);
  translate(10,10);
  name();
}
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
void name()
{
  L();
  translate(80,0);
  I();
  translate(80,0);
  P();
  translate(80,0);
  K();
  translate(80,0);
  I();
  translate(80,0);
  S();
  translate(80,0);
  S();
  if (textCursor == true)
  {
     translate(80,0);
     line(10,100,10,10);
  }
}
