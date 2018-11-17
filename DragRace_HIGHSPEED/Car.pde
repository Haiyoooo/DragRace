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
    force = new PVector(50, 0);
    brakeForce = new PVector(-50, 0);
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
    velocity.limit(40);
    acceleration.set(0,0);
    fill(100);
    textSize(20);
    text("SPEED " + int(velocity.x), width/2, height*0.9);
    println(velocity.x);
  }
  
  void gasPedal()
  {
    // everytime this function is called, acceleration increases
    acceleration.add(force);
  }
  
  void brakePedal()
  {
    velocity.set(0,0);
  }
  
  void render()
  {
    fill(100);
    rectMode(CENTER);
    
    //
    if(stateManager.gamestate == LOSE)
    {
      for(int i = 0; i < random (5, 10); i++)
      {
        //cool stuff
        rect(position.x + random(-w,w), position.y + random(-h,h), random(2,10), random(3,10));
      }
      } else {
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
  }
  
  boolean hitRightWall()
  {
    //if the car hits the right edge at a high speed, it will explode
    //if the car hits the right edge at a low speed, it will not explode
    if(position.x + w/2 > width && car.velocity.x >= 3)
    {
      crashSound.rewind();
      crashSound.play();
      return true;
      
    } else if (position.x + w/2 > width && car.velocity.x < 3)
    {
      velocity.x = 0;
      return false;
    }
    return false;
  }
  
  boolean foulStart()
  {
    if(position.x > startPos && !lights.isGreen())
    {
      crashSound.rewind();
      crashSound.play();
      acceleration.set(0,0);
      return true;
    }
    return false;
  }
}
