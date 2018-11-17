class StateManager
{
  int gamestate;
  
  StateManager()
  {
    gamestate = RUNNING;
  }
  
  void setState()
  {
    if(gamestate == RUNNING)
    {
      // player loses if they accelerate before lights turn green
      // player loses if they crash into the screen's right edge
      if(car.foulStart() || car.hitRightWall())
      {
        gamestate = LOSE;
        println("LOSE");
      }
      
      // player wins if the car stops within the finish zone
      if(finishLine.contains(car) && car.velocity.x < 3)
      {
       gamestate = WIN;
       println("WIN");
      }
    }


  }
  
  void running()
  {
    timer.update();
    lights.update();
    car.update();
    car.hitRightWall();
    car.foulStart();
    finishLine.update();
    
    timer.render();
    lights.render();
    finishLine.render();
    car.render();
  }
  
  void win()
  {
    lights.render();
    finishLine.render();
    car.render();
    timer.render();
    textSize(100);
    text("WIN!", width/2, height/2);
  }
  
  void lose()
  {
    //lights.render(); TODO
    finishLine.render();
    car.render();
    explosionAnimation(car.position.x, car.position.y);
    timer.render();
    textSize(100);
    text("GAMEOVER", width/2, height/2);
  }
  
}
