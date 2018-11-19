//Drag Race: Snail
//by Eunice Lim
//Nov 16, 2018

// Press any key to reset at any time
// click to move forward
// removed reversal

// BUG: Portal doesn't appear on time because Boolean HitLeftWall resets to false when the snail teleports over to the right.

//-------------* FAKE ENUM *-----------------//
static final int RESET = 0;
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
  size(1000,800);
  colorMode(HSB, 100);
  
  lights = new Lights();
  timer = new Timer();
  car = new Car();
  finishLine = new FinishLine();
  stateManager = new StateManager();

  loadSound();
  loadImages();
  

}

void draw()
{
  //background(128);
  image(grass, width/2, height/2, width, height * 1.2);
  stateManager.setState();
  
  switch(stateManager.gamestate)
  {
    case RUNNING:
      stateManager.running();
      playBgMusic();
      break;
    case LOSE:
      stateManager.lose();
      break;
    case WIN:
      stateManager.win();
      break;
    case RESET:
      stateManager.reset();
      break;
  }
    
}

void mousePressed()
{
  //if(mouseButton == LEFT && stateManager.gamestate == RUNNING)
  //{
    car.gasPedal();
    gas = true;
  //} else if (mouseButton == RIGHT && stateManager.gamestate == RUNNING)
  //{
  //  car.brakePedal();
  //  braking = true;
  //}
}

void keyPressed()
{
  if (key == 'p')
  {
    stateManager.gamestate = RESET;
  }
  else if (key == ' ')
  {
    car.brakePedal();
  }
}


void keyReleased()
{
  gas = false;
  braking = false;
}
