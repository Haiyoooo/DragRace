class FinishLine
{
  private float w;
  private float h;
  private PVector position;
  
  FinishLine()
  {
    w = 100;
    h = height *0.9;
    position = new PVector(800, height/2);
  }
  
  void update()
  {
    checkCollision(car);
  }
  
  void render()
  {
    noStroke();
    rectMode(CENTER);
    
    //finish area
    //stopping anywhere within this area counts as a win
    fill(50);
    rect(position.x, position.y, w, h);
    
    //finish line
    fill(10, 80, 80, 50);
    rect(position.x - w/2 + 5, position.y, 10, h);
  }
  
  boolean checkCollision(Car car)
  {
    // front of car has entered the finish area
    // rear of car hasn't exited the finish area
    if(car.position.x + car.w/2 > position.x - w/2 && 
       car.position.x - car.w/2 < position.x + w/2)
    {
      return true; //TODO: for win conditioin, it's collided + not  burning x) etc.
    }
    return false;
  }
}
