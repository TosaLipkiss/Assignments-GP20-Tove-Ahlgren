float cellsSize = 10;
int numberOfRows = 5;
int numberOfColums = 5;

Cell[][] cells;

void setup() 
{
	size(400, 400);
	ellipseMode(LEFT);
	frameRate(4);

	numberOfRows = (int)Math.floor(height / cellsSize);
	numberOfColums = (int)Math.floor(width / cellsSize);

	cells = new Cell[numberOfColums][numberOfRows];

	for(int y = 0; y < numberOfRows; y++)
	{
		for(int x = 0; x < numberOfColums; x++)
		{
			cells[x][y] = new Cell(x * cellsSize, y * cellsSize, cellsSize);
		}
	}
}

void draw() 
{
	//calculate next generation cells
	for(int y = 1; y < numberOfRows-1; y++)
	{
		for(int x = 1; x < numberOfColums-1; x++)
		{
			int neighbor = 0;

			boolean leftAlive = cells[x-1][y].alive;
			boolean rightAlive = cells[x+1][y].alive;

			boolean topAlive = cells[x][y-1].alive;
			boolean botAlive = cells[x][y+1].alive;

			boolean topLeftAlive = cells[x-1][y-1].alive;
			boolean topRightAlive  = cells[x+1][y-1].alive;

			boolean botLeftAlive  = cells[x-1][y+1].alive;
			boolean botRightAlive  = cells[x+1][y+1].alive;


			if (leftAlive == true)
			{
				neighbor += 1;
			}

			if (rightAlive == true)
			{
				neighbor += 1;
			}

			if (topAlive == true)
			{
				neighbor += 1;
			}

			if (botAlive == true)
			{
				neighbor += 1;
			}

			if (topLeftAlive == true)
			{
				neighbor += 1;
			}

			if (topRightAlive == true)
			{
				neighbor += 1;
			}

			if (botLeftAlive == true)
			{
				neighbor += 1;
			}

			if (botRightAlive == true)
			{
				neighbor += 1;
			}

			isAlive(neighbor, x, y);
		}
	}

	for(int x = 0; x < numberOfColums; x++)
	{
		for(int y = 0; y < numberOfRows; y++)
		{
			cells[x][y].alive = cells[x][y].buffer;
		}
	}

	background(100, 150, 220);

	for(int x = 0; x < numberOfColums; x++)
	{
		for(int y = 0; y < numberOfRows; y++)
		{
			cells[x][y].draw();
		}
	}
}

void isAlive(int neighbor, int x, int y)
{
	cells[x][y].buffer = cells[x][y].alive;

	//Any live cell with fewer than two live neighbors dies, as if caused by underpopulation.
	if(neighbor < 2)
	{
		cells[x][y].buffer = false;
	}

	//Any live cell with more than three live neighbors dies, as if by overpopulation.
	if(neighbor > 3)
	{
		cells[x][y].buffer = false;
	}

	//Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.
	if(neighbor == 3)
	{
		cells[x][y].buffer = true;
	}
}
