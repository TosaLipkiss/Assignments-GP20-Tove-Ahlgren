//This file is only for testing your movement/behavior.
//The Walkers will compete in a different program!

WalkerInterface walker;
PVector walkerPos;

void setup() 
{
  background(255, 255, 255);
  size(640, 480);

  //Create a walker from the class Example it has the type of WalkerInterface
  walker = new TovAhl();

  walkerPos = walker.getStartPosition(width, height);
}

void draw() 
{
  stroke(0, 0, 0);
//strokeWeight(4);
  point(walkerPos.x, walkerPos.y);
  walkerPos.add(walker.update());
}
