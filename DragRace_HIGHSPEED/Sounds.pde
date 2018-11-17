import ddf.minim.*;
Minim minim;
AudioPlayer crashSound;
AudioPlayer bgSound;

// PUT THIS FUNCTION IN SETUP
void loadSound()
{
  minim = new Minim(this);
  crashSound = minim.loadFile("Explosion_Ultra_Bass-Mark_DiAngelo-1810420658.mp3");
  bgSound = minim.loadFile("Kevin_MacLeod_-_Ouroboros_-_Full_Mix.mp3");
}

// PUT THIS FUNCTION IN DRAW
void playBgMusic()
{
  if(!bgSound.isPlaying())
  {
    bgSound.rewind();  
    bgSound.play();
  }
}

/* CREDITS
Explosion_Ultra_Bass-Mark_DiAngelo-1810420658 - Recorded by Mark DiAngelo - http://soundbible.com/1807-Explosion-Ultra-Bass.html
Kevin_MacLeod_-_Ouroboros_-_Full_Mix - Recorded by Kevin MacLeod - https://freemusicarchive.org/music/Kevin_MacLeod/Best_of_2014_1461/
*/
