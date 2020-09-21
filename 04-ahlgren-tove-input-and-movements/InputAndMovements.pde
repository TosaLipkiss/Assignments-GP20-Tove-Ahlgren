///////////Variables////////////////
PVector vectorInput = new PVector();


PVector position = new PVector();
PVector acceleration = new PVector();
PVector velocity = new PVector();
float friction=4.0f;

float speed=60.0f;
float maxSpeed=6.00f;

float time=0;
float deltaTime=0;

boolean moveLeft = false;
boolean moveRight = false;
boolean moveDown = false;
boolean moveUp = false;

///////////////Main/////////////////
void setup() 
{
	size(400,400);
	ellipseMode(CENTER);
	surface.setLocation(1500,0);
	position.y = height / 2;
	position.x = width / 2;
}

void draw() 
{
	background(0, 0, 0);

	float currentTime = millis();
	deltaTime = (currentTime - time) * 0.001f;

	acceleration = input();

	if(acceleration.mag()==0)
	{
		acceleration.x -= velocity.x * friction * deltaTime;
		acceleration.y -= velocity.y * friction * deltaTime;
	}

	//add acceleration to velocity
	velocity.add(acceleration);

	//Update velocity
	velocity.limit(maxSpeed);
	PVector move = velocity.copy();
	move.mult(speed*deltaTime);
	position.add(move);

	yWallCollision();
	crossSides();
	fire();
	rocket();

	time = currentTime;
}

///////////////METHODS//////////////

//rocket/player 2D graphics
void rocket()
{
	//Wings
	noStroke();
	fill(255, 0, 0);
	triangle(position.x+8, position.y+5, position.x+8, position.y+-5, position.x+17, position.y+5);
	triangle(position.x-8, position.y-5, position.x-8, position.y+5, position.x-17, position.y-(-5));
	//body
	noStroke();
	fill(255, 255, 255);
	ellipse(position.x, position.y+-3, 20, 29);
	//pipe
	fill(155, 155, 155);
	rect(position.x-5, position.y-(-10), 10, 4);
	//window
	fill(155, 155, 155);
	ellipse(position.x, position.y+-6, 10, 10);
	//tip
	fill(255, 0, 0);
	triangle(position.x+7, position.y-14, position.x+0, position.y-20, position.x-7, position.y-14);
}

void fire()
{
	boolean animateFire=true;

	if(frameCount % 10==0)
	{
		if (animateFire)
		{
			fill(250,40,0);
			ellipse(position.x, position.y+23, 10, 20);
			fill(225,225,0);
			ellipse(position.x, position.y+18, 6, 14);
		}
		else 
		{
			animateFire = !animateFire;
		}
	}
}


//Key functions methods
void keyPressed() 
{
	if (keyCode == LEFT || key == 'a')
	{
		moveLeft = true;
	}
	if (keyCode == RIGHT || key == 'd')
	{
		moveRight = true;
	}
	if (keyCode == DOWN || key == 's')
	{
		moveDown = true;
	}
	if (keyCode == UP || key == 'w')
	{
		moveUp = true;
	}
}
void keyReleased() 
{
	if (keyCode == LEFT || key == 'a')
	{
		moveLeft = false;
	}
	if (keyCode == RIGHT || key == 'd')
	{
		moveRight = false;
	}
	if (keyCode == DOWN || key == 's')
	{
		moveDown = false;
	}
	if (keyCode == UP || key == 'w')
	{
		moveUp = false;
	}
}

PVector input()
{
	int inputCorrection=1;
	vectorInput.x=0;
	vectorInput.y=0;

	if(moveLeft)
	{
		vectorInput.x -= inputCorrection;
	}
	if (moveRight)
	{
		vectorInput.x += inputCorrection;
	}
	if(moveDown)
	{
		vectorInput.y += inputCorrection;
	}
	if(moveUp)
	{
		vectorInput.y -= inputCorrection;
	}

	//normalize diagonally speed
	vectorInput.normalize();

	return vectorInput;
}

void crossSides()
{
	if(position.x > width)
	{
		position.x = 0;
	}
	if(position.x < 0)
	{
		position.x = width;
	}
}

void yWallCollision()
{
	if (position.y >= height-20)
	{
		position.y = height-20;
	}
	if (position.y <= 20)
	{
		position.y = 20;
	}
}
