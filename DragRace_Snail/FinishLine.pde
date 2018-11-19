class FinishLine
{
  private float w;
  private float h;
  private PVector position;
  
  FinishLine()
  {
    w = car.w*1.25;
    h = height * 0.1;
    position = new PVector(width * 0.85, height * 0.8);
  }
  
  void update()
  {
    contains(car);
  }
  
  void render()
  {
    
    rectMode(CENTER);
    
    //finish line
    noStroke();
    fill(10, 80, 80, 50);
    rect(position.x - w/2 + 5, position.y, 10, h);
  }
  
  boolean contains(Car car)
  {
    // FRONT of car touching finishline
    if(car.position.x + car.w/2 > position.x - w/2)
    {
      return true;
    }
    return false;
  }
  
}
