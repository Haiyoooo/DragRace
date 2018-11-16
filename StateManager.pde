class StateManager
{
  //-------------* FAKE ENUM *-----------------//
  static final int PAUSED = 0;
  static final int RUNNING = 1;
  static final int LOSE = 2;
  static final int WIN = 3;
  int gamestate;
  
  StateManager()
  {
    gamestate = RUNNING;
  }
  
  void setState()
  {
    if(finishLine.checkCollision(car) && car.velocity.x == 0)
    {
     gamestate = WIN;
    }
    
    if(lights.isGreen())
    {
      gamestate = LOSE;
      println("lose");
    }

  }
  
  void running()
  {
    timer.update();
    lights.update();
    car.update();
    car.checkHitWall();
    car.checkEarlyStart();
    finishLine.update();
    
    timer.render();
    lights.render();
    finishLine.render();
    car.render();
    
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
  
  void win()
  {
    
  }
  
  void lose()
  {
  }
  
}
