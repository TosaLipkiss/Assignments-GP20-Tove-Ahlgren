class Player
{
	//Create our movement vectors
	PVector position = new PVector();
	PVector velocity = new PVector();
	PVector acceleration = new PVector();
	//Player movement speed variables
	float accelerationMultiplyer = 0.75;
	float deaccelerationMultiplyer = 0.15;
	float speed = 60;
	float maxSpeed = 8;
	int size=20;
	boolean dead = false;

	Player()
	{
	  position.x = width / 2;
	  position.y = height / 2;
	  ellipseMode(CENTER);
	}

	void update(float deltaTime) 
	{
	  //Get input from the user/player
	  acceleration = input();
	  //prepare our acceleration
	  acceleration.mult(accelerationMultiplyer * speed * deltaTime);

	  //If no input, lenght of acceleration vector is 0, we should slow down
	  if (acceleration.mag() == 0) 
		  {
		    //Use our direction to create opposite breaking force.
		     acceleration.x -= velocity.x * deaccelerationMultiplyer * speed * deltaTime;
		     acceleration.y -= velocity.y * deaccelerationMultiplyer * speed * deltaTime;
		  }
	   //Update Velocity by adding acceleration.
	  velocity.add(acceleration);
	  //Limit our speed so we don't go to fast
	  velocity.limit(maxSpeed);
	  //Create a new temporary vector so deltaTime doesn't change our real velocity
	  PVector move = velocity.copy();
	  move.mult(speed * deltaTime);
	  position.add(move);
	}

	void draw()
	{
		fill(255,0,0);
		ellipse(position.x, position.y, size, size);
	}
}