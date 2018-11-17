class StateManager
{
  int gamestate;
  
  StateManager()
  {
    gamestate = RUNNING;
  }
  
  void setState()
  {
      // player loses if they accelerate before lights turn green
      // player loses if they crash into the screen's right edge
      if( (car.foulStart() || car.hitRightWall() )  && gamestate == RUNNING)
      {
        gamestate = LOSE;
        println("LOSE");
      }
      
      // player wins if the car stops within the finish zone
      if(finishLine.contains(car) && car.velocity.x < 3 && gamestate == RUNNING)
      {
       gamestate = WIN;
       println("WIN");
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
    //render
    //lights.render(); TODO
    finishLine.render();
    car.render();
    explosionAnimation(car.position.x, car.position.y, random(-3,3), random(-5,5));
    timer.render();
    textSize(100);
    text("GAMEOVER", width/2, height/2);
    textSize(20);
    text("Press P to play again", width/2, height/2 + 50);
  }
  
  void reset()
  {
    car.reset();
    timer.reset();
    lights.reset();
    stateManager.gamestate = RUNNING;
  }
}
