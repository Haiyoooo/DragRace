class Car
{
  PVector position; //I'm accessing this in other classes, should it be private?
  private PVector velocity;
  private PVector acceleration;
  private PVector force;
  private PVector brakeForce;
  private float startPos;
  float w;
  float h;
  
  Car()
  {
    startPos = 100;
    position = new PVector(startPos, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    force = new PVector(0.3, 0);
    brakeForce = new PVector(-1, 0);
    w = width*0.05;
    h = 30;
  }
  
  void reset()
  {
    position.set(startPos, height/2);
    velocity.set(0, 0);
    acceleration.set(0, 0);
  }
  
  void update()
  {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.set(0,0);
  }
  
  void gasPedal()
  {
    // everytime this function is called, acceleration increases
    acceleration.add(force);
  }
  
  void brakePedal()
  {
    // if the car is moving forwards, apply a backwards force
    // if the car has negative acceleration, stop it's movement
    if(velocity.x > 0)
    {
      acceleration.add(brakeForce);
    } else
    {
      velocity.x = 0; //TODO: tune the slowing down. Lerp?
    }
  }
  
  void render()
  {
    fill(100);
    rectMode(CENTER);
    
    // car changes colour when brake or gas is applied
    if(gas)
    {
      fill(50, 100, 100);
    }
    else if(braking)
    {
      fill(90, 100, 100);
    }
    
    rect(position.x, position.y, w, h);
  }
  
  void checkHitWall()
  {
    if(position.x > width)
    {
      position.x = width - w - 3;
      velocity.set(0,0);
      println("GAMEOVER");
    }
  }
  
  void checkEarlyStart()
  {
    if(position.x > startPos && !lights.isGreen())
    {
      position.set(startPos, height/2);
      explosionAnimation(position.x, position.y);
      println("GAMEOVER");
    }
  }
}
