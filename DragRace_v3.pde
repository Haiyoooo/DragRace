//Drag Race
//by Eunice Lim
//Nov 16, 2018
//TODO: Game states

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
  stateManager.running();

}

void mousePressed()
{
  car.reset();
  timer.reset();
}

void keyPressed()
{
  if(key == ' ')
  {
    car.gasPedal();
    gas = true;
  } else
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
