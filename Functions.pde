void explosionAnimation(float x, float y, float velX, float velY)
{
  // create particles at position x, y
  for(int i = 0; i < 5; i++)
  {
    particles.add( new Particles(x, y, velX, velY) );
  }
  
  // render, update and remove particles
  for(int i = particles.size() - 1; i >= 0; i--)
  {
    Particles p = particles.get(i);
    p.update();
    p.render();
    
    if(p.isDead())
    {
      particles.remove(i);
    }
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
