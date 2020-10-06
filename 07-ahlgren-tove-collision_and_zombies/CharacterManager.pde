class CharacterManager
{
	Human[] human;
	Zombie[] zombie;
	boolean printGameOver = false;

	public CharacterManager()
	{
		human = new Human[99];
	 	zombie  = new Zombie[100];

		for(int i = 0 ; i < human.length ; i++)
		{
			human[i] = new Human();
		}
		zombie[0] = new Zombie();
	}

	void update()
	{
		for(int i = 0 ; i < human.length ; i++)
		{
			if (human[i] != null)
			{
				human[i].update();
			}
		}
		for(int i = 0 ; i < zombie.length ; i++)
		{
			if(zombie[i] != null)
			{
				zombie[i].update();			
			}
		}

		for(int i = 0 ; i < human.length ; i++)
		{
			if(human[i] != null)
			{
				for(int j = 0 ; j < zombie.length ; j++)
				{
					if (zombie[j] != null)
					{
						boolean zombieCollision = zombieCollision(human[i].position.x, human[i].position.y, 
						zombie[j].position.x, zombie[j].position.y, 
						human[i].radiusPositive, zombie[j].radiusPositive);

						if(zombieCollision == true)
						{
							PVector collisionPosition = human[i].position;
							human[i] = null;

							for(int k = 0; k < zombie.length ; k++)
							{
								if(zombie[k] == null)
								{
									zombie[k] = new Zombie();
									zombie[k].position = collisionPosition;
									break;
								}
							}
							break;
						}			
					}
				}
			}
		}
		boolean hasNull = false;

		for(int i = 0 ; i < zombie.length ; i++)
		{
			if(zombie[i] == null)
			{
				hasNull = true;
			}
		}

		if(hasNull != true)
		{
			printGameOver = true;
		}
	}

	void draw()
	{
		for(int i = 0 ; i < human.length ; i++)
		{
			if(human[i] != null)
			{
				human[i].draw();			
			}
		}
		for (int i = 0 ; i < zombie.length ; i++)
		{
			if(zombie[i] != null)
			{
				zombie[i].draw();			
			}
		}

		if (printGameOver == true)
		{
			println("GAME OVER");
			textAlign(CENTER,CENTER);
			textSize(50);
			fill(255, 0, 0);
			text("GAME OVER", width/2, height/2);
		}
	}

	boolean zombieCollision(float humanX, float humanY, float zombieX, float zombieY, float humanSize, float zombieSize)
	{
		float maxDistance = humanSize + zombieSize;

		if (dist(humanX, humanY, zombieX, zombieY) > maxDistance)
		{
			return false;
		}
		else
		{
			return true;
		}
	}
}