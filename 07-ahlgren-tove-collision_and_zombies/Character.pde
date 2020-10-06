class Character
{
  PVector position = new PVector();
  PVector velocity = new PVector();
  PVector direction = new PVector();
  float charSize;
  color charColor;
  float radiusPositive;
  float radiusNegative;
  float directionTimer = random(1, 5);
  float speed;

  public Character()
  {
    charSize = 20.0;
    radiusPositive = charSize * 0.5;
    radiusNegative = charSize * -0.5;
    position.x = random(0,width);
    position.y = random(0,height);

    float angle = random(0.0, 360.0);
    direction.x = cos(radians(angle));
    direction.y = -sin(radians(angle));
  }

  void update()
  {
    if(directionTimer <= 0)
    {
      float angle = random(0.0, 360.0);
      direction.x = cos(radians(angle));
      direction.y = -sin(radians(angle));

      directionTimer = random(1, 3);
    }

    position.x += (deltaTime * speed * direction.x);
    position.y += (deltaTime * speed * direction.y);


    if (position.x > width + radiusPositive)
    {
      position.x = radiusNegative;
    }

    else if (position.x < radiusNegative)
    {
    	position.x = width + radiusPositive;
    }

    if (position.y > height + radiusPositive)
    {
      position.y = radiusNegative;
    }

    else if (position.y < radiusNegative)
    {
    	position.y = height + radiusPositive;
    }

    directionTimer -= deltaTime;
  }

  void draw()
  {
    fill(charColor);
    ellipseMode(CENTER);
    ellipse(position.x, position.y, charSize, charSize);
  }
}
