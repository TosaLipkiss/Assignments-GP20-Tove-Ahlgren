class Zombie extends Character
{
  public Zombie()
  {
  	velocity.x = 0.5;
    velocity.y = 0.5;
    speed = 25;
  	charColor = color (100, 200, 0);
  }

  void draw()
  {
  	fill(charColor);
  	ellipseMode(CENTER);
  	ellipse(position.x, position.y, charSize, charSize);
  }
}
