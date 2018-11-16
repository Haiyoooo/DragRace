//TODO: Lerp colours for proper flame/explosion effects, based on distance from spawn point

class Particles
{
  private PVector position;
  private PVector velocity;
  private PVector acceleration;
  private float lifespan;
  private float size;
  private color explosionColor1;
  private color explosionColor2;
  
  Particles(float tempX, float tempY)
  {
    position = new PVector(tempX, tempY);
    velocity = new PVector(random(-1,1), random(-3,0));
    
    lifespan = 100;
    size = random(10, 20);
    explosionColor1 = color(100, 100, 100, random(20,50));
    explosionColor2 = color(100, 0, 50, 0);
  }
  
  void update()
  {
    lifespan -= 1;
    
    //velocity.add(acceleration);
    position.add(velocity);
    //velocity = PVector.random2D();
    
    explosionColor1 = lerpColor(explosionColor1, explosionColor2, 0.02);
  }
  
  void render()
  {
    noStroke();
    fill(explosionColor1);
    ellipse(position.x, position.y, size, size);
  }
  
  boolean isDead()
  {
    if(position.y < height/2 - 100)
    {
      return true;
    } else
    {
      return false;
    }
  }
}
