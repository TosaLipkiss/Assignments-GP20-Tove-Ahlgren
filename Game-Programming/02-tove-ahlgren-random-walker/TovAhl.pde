class TovAhl implements WalkerInterface 
{
  PVector currentPosition;
  PVector direction;

  ArrayList<PVector> oldPositions = new ArrayList<PVector>();

  int screenWidth;
  int screenHeight;

  String getName()
  {
    return "Tove"; 
  }

  PVector getStartPosition(int playAreaWidth, int playAreaHeight)
  {
    screenWidth = playAreaWidth;
    screenHeight = playAreaHeight;
    direction = new PVector(1,0);

    currentPosition = new PVector(screenWidth/2,screenHeight/2);
    return new PVector(currentPosition.x, currentPosition.y);
  }

  PVector update()
  {
    int numberOfTries = 100;

    while (true) 
    {
      //STEG 1
      int randomNumber = (int)random(0, 4);
      //What happens when the randomizer has number 0-3
      if(randomNumber == 0)
      {
        direction = new PVector(-1,0);
      }
      else if(randomNumber == 1)
      {
        direction = new PVector(1,0);
      }
      else if(randomNumber == 2)
      {
        direction = new PVector(0,1);
      }
      else if(randomNumber == 3)
      {
        direction = new PVector(0,-1);
      }

      //STEG 2
      //if position(x,y) (+) direction(x,y) is bigger or smaller is collides and do a new randomizer from start
      if((currentPosition.x + direction.x) >= screenWidth)
      {
        continue;
      }
      else if((currentPosition.x + direction.x) < 0)
      {
        continue;
      }
      else if((currentPosition.y + direction.y) >= screenHeight)
      {
        continue;
      }
      else if((currentPosition.y + direction.y) < 0)
      {
        continue;
      }

      //STEG 3
      boolean replayFromStart = false;

      //om de e en ARRAY så är det .lenght, men om de är ARRAYLIST så är de .size()
      //kollar om den e påväg till en gammal position
      for(int i = 0; i < oldPositions.size(); i++)
      {
        PVector oldPosition = oldPositions.get(i);
        if((currentPosition.x + direction.x) == oldPosition.x && (currentPosition.y + direction.y) == oldPosition.y)
        {
          replayFromStart = true;
        }
      }

      //STEG 4
      if(replayFromStart == true)
      {
        numberOfTries --;
        if(numberOfTries == 0)
        {
          break;
        }
        continue;
      }

      break;
    }

    currentPosition.x += direction.x;
    currentPosition.y += direction.y;

    //lägg till som en oldPosition i arraylistan
    oldPositions.add(new PVector(currentPosition.x, currentPosition.y));

    return direction;
  }
}
