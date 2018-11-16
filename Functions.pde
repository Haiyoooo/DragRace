void explosionAnimation(float x, float y)
{
  // create particles at position x, y
  for(int i = 0; i < 5; i++)
  {
    particles.add( new Particles(x, y) );
  }
}

void colorAnimation(color colorStart, color colorEnd, float delay)
{
  //changes colour from Start to End after a certain delay
  fill(colorStart);
  
  if(timer.currentTime > delay + timer.startTime || lights.isGreen())
  {
    fill(colorEnd);
  }
}
