int frame = 0;
float multiplier = 0.002f;
int numberOfPoints = 100;
int posX = 0;
int vel = 2;
int distance;

int resizer = 5;

float time;
float deltaTime=0;
float timeCounter = 0;

int timer = 0;
float speed = 0.5f;

float curveA = 50;

void setup()
{
  size(640, 480);
  frameRate(30);
  strokeWeight(5);
  distance = (width/numberOfPoints ) +5;
}

void draw()
{
  float currentTime = millis();
  deltaTime = (currentTime - time) * 0.001f;
  timeCounter += deltaTime;

  if (timeCounter >= 0.01)
  {
    curveA += resizer;
    timeCounter = 0;
    //
    if(curveA <= -100)
    {
      //konventerar negativt 5 till positivt 5
      resizer *= -1;      //5 * (-1) = -5
    }
    else if(curveA >= 100)
    {
      //konverterar  positiv 5 till negativ 5
      resizer *= -1;      //-5 * (-1) = 5
    }
  }

  float spiralRadius = 0.0f;
  int x = width/2;
  int y = height/2;
  int n = 40;

  background(0, 0, 0);
  stroke(255,0,0);
  point(x, y);

    for(int i = 0; i < numberOfPoints; i ++)
  {
    points(i);
  }

  frame ++;

  stroke(59,197,255);

  for(int i=0; i <= n * 4; i++)
  {
    stroke(random(255),random(255),random(255));
    float stepSize = PI * 2 / n;
    //45 * 0, 45 * 1, 45 * 2....
    point(x + cos(stepSize * i) * spiralRadius,y - sin(stepSize * i) * spiralRadius);
    spiralRadius += 0.7 + i * 0.01f;
  }
    time = currentTime;
}

void points(int i)
{
  stroke(150, 255, 255);
  point(i * 10, 240 + sin((frame * 0.06) + (i * 0.20)) * curveA);

  stroke(216, 132, 213);
                                          //PI/2 = 90 (flip)
  point(i * 10, 240 + cos((frame * 0.06) + (i * 0.20)+PI/2) * curveA);
}
