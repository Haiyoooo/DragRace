class Timer
{
  //related to racing stopwatch
  float startRaceTime;
  float elapsedRaceTime;
  float endRaceTime;
  
  //related to whole period, including countdown
  float initializeTime;
  
  
  Timer()
  {
    startRaceTime = 0;
    initializeTime = millis();
  }
  
  void reset()
  {
    startRaceTime = 0;
    initializeTime = millis();
  }
  
  void update()
  {
    Stopwatch(); //<>//
  }
  
  void Stopwatch()
  {
    //start of race
    if (startRaceTime == 0 && lights.isGreen())
    {
      startRaceTime = millis();
    }
    
    if (startRaceTime > 0)
    {
      elapsedRaceTime = millis() - startRaceTime;
    } else
    {
      elapsedRaceTime = 0;
    }

  }
  
  void render()
  {
    fill(100);
    textSize(40);
    
    //if race hasn't started, display 00
    //if race has started, start the stopwatch
    if(startRaceTime == 0)
    {
      text("READY? " + startRaceTime/1000, 100, 100);
    } else if (startRaceTime > 0)
    {
      text("RACE! " + elapsedRaceTime/1000, 100, 100); //<>// //<>//
    }
    
    textSize(20);
    text("start Race Time " + startRaceTime/1000, 100, 150);
    text("current Race Time " + elapsedRaceTime/1000, 100, 180);
    text("millis() " + millis()/1000, 100, 210);
    text("initialize Time" + initializeTime, 500, 150);

  }
}
