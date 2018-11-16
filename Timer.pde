class Timer
{
  float currentTime;
  float startTime;
  float endTime;
  
  Timer()
  {
    startTime = 0;
  }
  
  void reset()
  {
    startTime = 0;
  }
  
  void update()
  {
    begin();
    currentTime = millis() - startTime; //<>// //<>//
  }
  
  void begin()
  {
    if (startTime == 0 && racing == true)
    {
      startTime = millis();
    }
  }
  
  void render()
  {
    fill(100);
    textSize(40);
    
    //if race hasn't started, display 00
    //if race has started, start the stopwatch
    if(startTime == 0)
    {
      text("READY? " + startTime/1000, 100, 100);
    } else if (startTime > 0)
    {
      text("RACE! " + currentTime/1000, 100, 100); //<>// //<>//
    }
    
    textSize(20);
    text("startTime " + startTime/1000, 100, 150);
    text("currentTime " + currentTime/1000, 100, 180);
    text("millis() " + millis()/1000, 100, 210);

  }
}
