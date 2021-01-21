float deltaTime;
float time;
CharacterManager characterManager;

void setup() 
{
	size(500, 500);

	characterManager = new CharacterManager();
}

void draw() 
{
	long currentTime = millis();
    deltaTime = (currentTime - time) * 0.001f;

    characterManager.update();

	background(255, 255, 255);

    characterManager.draw();

	time = currentTime;
}
