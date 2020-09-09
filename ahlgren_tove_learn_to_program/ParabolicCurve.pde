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
 
 //This is the result of my parabolic circle in a loop calculating the unit circle(enhetscirkeln) 
 //the line do 32 steps in a 360degree circle. 360/32=11.25. Adding x2 steps in 360 and angle to 11.(4)25

 //left eyeball
 float angleL=0.0;
 translate(120, 120);
 for(int i=0;i<64;i++)
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
  angleL += 11.425;
 }

 //right eyeball
 float angleR=0.0;
 translate(240, 0);
 for(int i=0;i<64;i++)
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
  angleR += 11.425;
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
