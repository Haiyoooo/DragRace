//Drag Race
//by Eunice Lim
//Nov 16, 2018

//TODO: Game states
//TODO: Tune losing/wining conditions to feel better
//TODO: Spilt the lights render + animation into two different functions. So that in "lose" state, we can use render without update to have a snapshot of the lights
// Alternatively, remove lights. Or render a 'lose' lights with Xs. etc.

  //-------------* FAKE ENUM *-----------------//
  static final int PAUSED = 0;
  static final int RUNNING = 1;
  static final int LOSE = 2;
  static final int WIN = 3;

ArrayList<Particles> particles = new ArrayList<Particles>();
Lights lights;
Timer timer;
Car car;
FinishLine finishLine;
StateManager stateManager;

boolean gas;
boolean braking;


void setup()
{
  size(1500,500);
  colorMode(HSB, 100);
  
  lights = new Lights();
  timer = new Timer();
  car = new Car();
  finishLine = new FinishLine();
  stateManager = new StateManager();
}

void draw()
{
  background(128);
  stateManager.setState();
  
  //if(stateManager.gamestate == RUNNING)
  //{
  //  stateManager.running();
  //}
  
  switch(stateManager.gamestate)
  {
    case RUNNING:
      stateManager.running();
      break;
    case LOSE:
      stateManager.lose();
      break;
    case WIN:
      stateManager.win();
      break;
  }
    
}

void mousePressed()
{
  car.hitRightWall();
  //car.reset();
  //timer.reset();
}

void keyPressed()
{
  if(key == ' ' && stateManager.gamestate == RUNNING)
  {
    car.gasPedal();
    gas = true;
  } else if (key == 'b' && stateManager.gamestate == RUNNING)
  {
    car.brakePedal();
    braking = true;
  }
}

void keyReleased()
{
  gas = false;
  braking = false;
}
