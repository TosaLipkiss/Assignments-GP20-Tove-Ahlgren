public class Cell
{
	float positionX;
	float positionY;
	float cellSize;

	color randomCellColor = color(random(150, 255), random(150, 255), random(150, 255));

	boolean alive = false;
	boolean buffer = false;

	public Cell(float x, float y, float size)
	{
		positionX = x;
		positionY = y;
		cellSize = size;

		if(random(0, 100) < 15)
		{
			alive = true;
		}
	}

	void draw()
	{
		if(alive)
		{
			fill(randomCellColor);
			rect(positionX, positionY, cellSize, cellSize);
		}
	}
}