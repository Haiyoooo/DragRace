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
  // changes colour after a delay
  // delay with respect to the time the program initialized (including resets)
  fill(colorStart);  
  if(millis() > delay + timer.initializeTime || lights.isGreen())
  {
    fill(colorEnd);
  }
}
