class Lights
{
  private PVector position;
  float delay;
  float size;
  float gap;
  
  Lights()
  {
    position = new PVector(width/2, 100);
    delay = 1000;
    size = 20;
    gap = size * 1.5;
  }
  
  void reset()
  {
  }
  
  void update()
  {
    isGreen();
  }
  
  void render()
  { 
    color red = color(100, 100, 100);
    color yellow = color(15, 100, 100);
    color orange = color(10, 100, 100);
    color green = color(40, 90, 100);
    
    strokeWeight(2);
    
    colorAnimation(0, red, delay);
    ellipse(position.x, position.y, size, size);
    
    colorAnimation(0, yellow, delay * 2);
    ellipse(position.x, position.y + gap, size, size);
    
    colorAnimation(0, yellow, delay * 3);
    ellipse(position.x, position.y + gap * 2, size, size);
     //<>// //<>//
    colorAnimation(0, green, delay * 4);
    ellipse(position.x, position.y + gap * 3, size, size);
  }
  
  boolean isGreen() //<>//
  {
    if(timer.currentTime > delay * 4 + timer.startTime)
    {
      return true;
    }
    return false;
  }

}
