///////////Variables////////////////
PVector vectorInput = new PVector();


PVector position = new PVector();
PVector acceleration = new PVector();
PVector velocity = new PVector();
float friction=2.0f;

float speed=1.0f;
float maxSpeed=2.00f;

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
	//println(currentTime-time);

	rocket();
	acceleration = input();

	println(acceleration.mag());

	if(acceleration.mag()<=0)
	{
		acceleration.x -= velocity.x * friction;
		acceleration.y -= velocity.y * friction;
	}

	//normalize diagonally speed
	acceleration.normalize();

	//add acceleration to velocity
	acceleration.mult(deltaTime);
	velocity.add(acceleration);

	//Update velocity
	velocity.mult(speed);
	velocity.limit(maxSpeed);
	position.add(velocity);

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
	rect(position.x-5, position.y-(-10), 9, 4);
	//window
	fill(155, 155, 155);
	ellipse(position.x, position.y+-5, 10, 10);
	//tip
	fill(255, 0, 0);
	triangle(position.x+7, position.y-14, position.x+0, position.y-20, position.x-7, position.y-14);
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
	vectorInput.x=0;
	vectorInput.y=0;

	if(moveLeft)
	{
		vectorInput.x -= 1;
	}
	if (moveRight)
	{
		vectorInput.x += 1;
	}
	if(moveDown)
	{
		vectorInput.y += 1;
	}
	if(moveUp)
	{
		vectorInput.y -= 1;
	}

	vectorInput.normalize();

	return vectorInput;
}


void crossSides()
{
	if(position.x == 399)
	{
		position.x -= 300;
	}
	if(position.x == 0)
	{
		position.x += 399;
	}
}
