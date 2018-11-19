class Car
{
  PVector position; //I'm accessing this in other classes, should it be private?
  private PVector velocity;
  private PVector acceleration;
  private PVector force;
  private PVector brakeForce;
  private float startPosX;
  private float startPosY;
  float w;
  float h;
  
  Car()
  {
    startPosX = 150;
    startPosY = height * 0.75;
    position = new PVector(startPosX, startPosY);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    force = new PVector(1, 0); //0.01
    brakeForce = new PVector(-0.02, 0);
    w = 346 * 0.4 * 1.5;
    h = 178 * 0.5 * 1.5;
  }
  
  void reset()
  {
    position.set(startPosX, startPosY);
    velocity.set(0, 0);
    acceleration.set(0, 0);
  }
  
  void update()
  {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.set(0,0);
    fill(100);
    textSize(20);
    text("SPEED " + velocity.x, width/2, height*0.9);
    println(velocity.x);
  }
  
  void gasPedal()
  {
    // everytime this function is called, forward acceleration increases
    acceleration.add(force);
  }
  
  void brakePedal()
  {
    // everytime this function is called, backward acceleration increases
    acceleration.add(brakeForce);
  }
  
  void render()
  {
    fill(100);
    noStroke();
    rectMode(CENTER);
    imageMode(CENTER);
    
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
        image(snail, position.x, position.y, w, h);
        //rect(position.x, position.y, w, h);
      }
  }
  
  boolean hitRightWall()
  {
    //if the car hits the right edge at a high speed, it will explode
    //if the car hits the right edge at a low speed, it will not explode
    if( (position.x + w/2 > width && car.velocity.x >= 3)
        || (position.x - w/2 < 0 && car.velocity.x <= -3) )
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
    if(position.x > startPosX && !lights.isGreen())
    {
      crashSound.rewind();
      crashSound.play();
      acceleration.set(0,0);
      return true;
    }
    return false;
  }
  
  boolean hitLeftWall()
  {
    if(position.x < 50)
    {
      position.x = width - w/2;
      teleportSound.rewind();
      teleportSound.play();


      dramaticSound.rewind();
      dramaticSound.play();
       return true;
    }
    return false;
  }
}
