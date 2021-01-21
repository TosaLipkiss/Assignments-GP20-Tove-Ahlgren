Player player;
Ball[] balls;
int numberOfBalls=10;
//Time variables
float deltaTime;
long time;

void setup()
{
  size(640,480);
  ellipseMode(CENTER);
  start();
}
////////MAIN///////////////
void draw() 
{
  clearBackground();

  long currentTime = millis();
  deltaTime = (currentTime - time);
  deltaTime *= 0.001f;

  //add 10 balls
  for(int i = 0; i < numberOfBalls; i++)
  {
    //check collision between player and balls[i] due position and size
    boolean collision = roundCollision(player.position.x, player.position.y, player.size/2, balls[i].position.x, balls[i].position.y, balls[i].size/2);
    if(collision)
    {
      //if a ball collide with the player the player will disappear by size set to 0
      player.size=0;
      player.dead = true;
    }

    balls[i].update();
  }

  //Redraw all balls
  for(int i = 0; i < numberOfBalls ; i++)
    {
      //call 10 balls
      balls[i].draw();
    }


  //call and update player
  player.update(deltaTime);
  player.draw();

  //when player die, spawn text GAME OVER
  if(player.dead)
  {
    gameOver();
  }

  time = currentTime;
}

/////////METHODS/////////
//create player and ball from their classes
void start()
{
  player = new Player();
  balls = new Ball[numberOfBalls];

  for (int i = 0; i < balls.length ; i++)
  {
    balls[i] = new Ball();
  }
}

//collision method which check distance and return a true or false result
boolean roundCollision(float x1, float y1, float size1, float x2, float y2, float size2)
{
  float maxDistance = size1+size2;

  if(abs(x1-x2) > maxDistance || abs(y1-y2) > maxDistance)
  {
    return false;
  }
  else if(dist(x1,y1,x2,y2) > maxDistance)
  {
    return false;
  }
  else
  {
    return true;
  }
}

void gameOver()
{
  filter(GRAY);
  fill(255,0,0);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("GAME OVER", width/2, height/2);

  if (keyPressed)
  {
    if(key=='r')
    {
      start();
    }
  }
}

void clearBackground()
{
  fill(255,255,255,40);
  rect(0,0,width,height);
}