void setup()
{
  size(480, 240);
}

void draw()
{
  background(250,250,250);
  eyeShapes();
  parabolicPupils();
}


//-------------------------METHODS-------------------------------//


void parabolicPupils()
{
  int numberOfLines=51;
	strokeWeight(2);
	ellipse(120, 120, 180, 180);
	ellipse(360, 120, 180, 180);
	strokeWeight(1);
	fill(250,250,250);

  resetMatrix();

 //----------------Test Code for parabolic circle----------------//
 //translate(120, 120);
 //My first check of the first line: line(cos(radians(90.0))*100, -sin(radians(90.0))*100, cos(radians(210))*100, -sin(radians(210))*100);
 //and adding next line: line(cos(radians(90.0-11.25))*100, -sin(radians(90.0-11.25))*100, cos(radians(210-11.25))*100, -sin(radians(210-11.25))*100);
 //-------------------------------------------------------------//
 
 //creating parabolic circle in a loop calculating the unit circle(enhetscirkeln) 
 //the line do 51 steps in a 360degrees circle. 360/51=7,058823529411765 (degrees)

 //left eyeball
 float angleL=0.0;
 translate(120, 120);
 for(int i=0;i<numberOfLines;i++)
 {
    if (i % 3==0)
    {
      stroke(0,0,0,200);
    }
    else
    {
      stroke(0,0,0,64);
    }
  line(cos(radians(angleL))*90, -sin(radians(angleL))*90, cos(radians(angleL+120))*90, -sin(radians(angleL+120))*90); 
  angleL += 360/numberOfLines;
 }

 //right eyeball
 float angleR=0.0;
 translate(240, 0);
 for(int i=0;i<numberOfLines;i++)
 {
    if (i % 3==0)
    {
      stroke(0,0,0,200);
    }
    else
    {
      stroke(0,0,0,64);
    }
  line(cos(radians(angleR))*90, -sin(radians(angleR))*90, cos(radians(angleR+120))*90, -sin(radians(angleR+120))*90); 
  angleR += 360/numberOfLines;
 }
}

//4 parabolic shapes, creates a shape of two eyelids
void eyeShapes()
{
	int shift=0;
	while (shift <= 240)
  {
    if (shift % 3==0)
    {
      stroke(0,0,0,200);
    }
    else
    {
      stroke(0,0,0,64);
    }
    //creating line as parabolic for left eyelids
    line(shift,0,240,shift);
    line(0,shift,shift,240);
    //creating line as parabolic for right eyelids
    line(240+shift,240,480,240-shift);
    line(240,240-shift,240+shift,0);
    shift += 10;
  }
}


void peak()
{
  int shift=0;
  while (shift <= 240)
  {
    if (shift % 3==0)
    {
      stroke(0,0,0,200);
    }
    else
    {
      stroke(0,0,0,64);
    }
    //creating line as parabolic for left eyelids
    line(shift,0,240,shift);
    line(0,shift,shift,240);
    //creating line as parabolic for right eyelids
    line(240+shift,240,480,240-shift);
    line(240,240-shift,240+shift,0);
    shift += 10;
  }
}
