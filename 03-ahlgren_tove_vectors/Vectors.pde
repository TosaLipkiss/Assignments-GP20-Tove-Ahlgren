PVector pos = new PVector();
PVector dir = new PVector();
float speed = 0.05f;
float size = 20f;
color backgroundColor = color(255, 255, 255);
color frameColor = color(255,0,0);
color ballColor = color(255,0,0);

void setup()
{
	size(400,400);
	ellipseMode(CENTER);
	pos.x=width/2;
	pos.y=height/2;
}

void draw()
{
	background(backgroundColor);
	pos.add(dir);
	ball();

	if (mousePressed==true)
	{
		line(pos.x, pos.y, mouseX, mouseY);
	}
	bounce();
}

///////////METHODS////////////////////////

void bounce()
{
	if (pos.x <= 0 || pos.x >= width)
	{
		dir.x *= -1;
	}
	if (pos.y <= 0 || pos.y >= width)
	{
		dir.y *= -1;
	}
}

void ball()
{
	stroke(0,0,0);
	fill(ballColor);
	ellipse(pos.x, pos.y, size, size);
}

void mousePressed() 
{
	//ball spawn where mouse button is pressed
	pos.x = mouseX;
	pos.y = mouseY;
	//when mouse button is pressed, stop the direction on the ball
	dir.x = 0;
	dir.y = 0;
}

void mouseReleased() 
{
	PVector input = new PVector(mouseX, mouseY);
	dir = input.sub(pos);
	dir = dir.mult(speed);
}
