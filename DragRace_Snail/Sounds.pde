import ddf.minim.*;
Minim minim;
AudioPlayer crashSound;
AudioPlayer bgSound;
AudioPlayer teleportSound;
AudioPlayer dramaticSound;

// PUT THIS FUNCTION IN SETUP
void loadSound()
{
  minim = new Minim(this);
  crashSound = minim.loadFile("Explosion_Ultra_Bass-Mark_DiAngelo-1810420658.mp3"); //Recorded by Mark DiAngelo @ http://soundbible.com/1807-Explosion-Ultra-Bass.html
  bgSound = minim.loadFile("Kevin_MacLeod_-_Ouroboros_-_Full_Mix.mp3"); //Recorded by Kevin MacLeod @ https://freesound.org/people/Andromadax24/sounds/178347/
  teleportSound = minim.loadFile("178347__andromadax24__s-teleport-03.wav"); //Recorded by Andromadax4 @ https://freesound.org/people/Andromadax24/sounds/178347/
  dramaticSound = minim.loadFile("76061__digifishmusic__dramatic5.wav"); //Recorded by digifishmusic @ https://freesound.org/people/digifishmusic/sounds/76061/
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
