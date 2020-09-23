boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;
PVector inputVector = new PVector();

//Key pressed, set our movement variables to true
void keyPressed()
{
    if (keyCode == LEFT || key == 'a')
      moveLeft = true;
    else if (keyCode == RIGHT || key == 'd')
      moveRight = true;

    if (keyCode == UP || key == 'w')
      moveUp = true;
    else if (keyCode == DOWN || key == 's')
      moveDown = true;
}

//When a key is released, we will set our variable to false
void keyReleased()
{
    if (keyCode == LEFT || key == 'a')
      moveLeft = false;
    else if (keyCode == RIGHT || key == 'd')
      moveRight = false;

    if (keyCode == UP || key == 'w')
      moveUp = false;
    else if (keyCode == DOWN || key == 's')
      moveDown = false;
}

//Returns a nomilized PVector input
PVector input()
{
  inputVector.x = 0;
  inputVector.y = 0;

  if (moveLeft) {
    inputVector.x -= 1;
  }
  if (moveRight) {
    inputVector.x += 1;
  }
  if (moveUp) {
    inputVector.y -= 1;
  }
  if (moveDown) {
    inputVector.y += 1;
  }

  inputVector.normalize();
  return inputVector;
}
