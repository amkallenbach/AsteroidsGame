  //your variable declarations here
SpaceShip gelato = new SpaceShip();
Stars [] galaxy;
ArrayList<Asteroids>asteroidsList = new ArrayList<Asteroids>();
Bullet sorbet = new Bullet(gelato);
ArrayList<Bullet>bullets = new ArrayList<Bullet>();

public void setup() 
{
  size(700,700);
  background(0,0,0);
  galaxy = new Stars [150];
    for (int i = 0; i < galaxy.length; i++)
    {
      galaxy[i] = new Stars();
    }
    for (int i = 0; i< 21; i++)
    {
      asteroidsList.add(new Asteroids());
    }
}
public void draw() 
{
  background(0,0,0);
  for (int i = 0; i < galaxy.length; i++)
  {
    galaxy[i].show();
  }
  for (int i = 0; i < asteroidsList.size(); i++)
  {
    asteroidsList.get(i).show();
    asteroidsList.get(i).move();
    if (dist(gelato.getX(), gelato.getY(), asteroidsList.get(i).getX(), asteroidsList.get(i).getY()) < 20)
      asteroidsList.remove(i);
  }
  for (int i = 0; i < bullets.size(); i++)
  {
    bullets.get(i).show();
    bullets.get(i).move();
  }

  gelato.show();
  gelato.move();


}

public void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      gelato.accelerate(0.5);
    }
    if (keyCode == DOWN)
    {
      gelato.accelerate(-0.5);
    }
    if (keyCode == LEFT)
    { 
      gelato.rotate(-15);
    }
    if (keyCode == RIGHT)
    {
      gelato.rotate(15);
    }
  }
  if (key == 'z')
  {
    gelato.setX((int)(Math.random()*700));
    gelato.setY((int)(Math.random()*700));
    gelato.setDirectionX(0);
    gelato.setDirectionY(0);
  }
  
}

class Bullet extends Floater
{
  Bullet(SpaceShip theShip)
    {
      myCenterX = theShip.getX();
      myCenterY = theShip.getY();
      myPointDirection = theShip.getPointDirection();
      double dRadians = myPointDirection*(Math.PI/180);
      myDirectionX = 5 * Math.cos(dRadians) + theShip.getDirectionX();
      myDirectionY = 5 * Math.sin(dRadians) + theShip.getDirectionY();
    }
    public void setX(int x){myCenterX = x;}
    public int getX(){return (int)myCenterX;}   
    public void setY(int y){myCenterY = y;}   
    public int getY(){return (int)myCenterY;}   
    public void setDirectionX(double x) {myDirectionX = x;}
    public double getDirectionX(){return (double)myDirectionX;}   
    public void setDirectionY(double y) {myDirectionY= y;}
    public double getDirectionY() {return (double)myDirectionY;}
    public void setPointDirection(int degrees) {myPointDirection = degrees;}   
    public double getPointDirection(){return (int)myPointDirection;} 
   
    public void show ()  
    {             
      noStroke();
      fill(208,62,179);
      ellipse( (float)myCenterX, (float)myCenterY, 10,10);
    }  
}

class Asteroids extends Floater
{
  private int rotateSpeed;

  Asteroids()
  {
      corners = 7;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -6;
      yCorners[0] = 6;
      xCorners[1] = 4;
      yCorners[1] = 8;
      xCorners[2] = -8;
      yCorners[2] = 2;
      xCorners[3] = -8;
      yCorners[3] = -2;
      xCorners[4] = -4;
      yCorners[4] = -2;
      xCorners[5] = -6;
      yCorners[5] = -8;
      xCorners[6] = 8;
      yCorners[6] = 0;
      myColor = (110);
      myCenterX = (Math.random()*width);
      myCenterY = (Math.random()*height);
      myDirectionX = (Math.random()*5-2);
      myDirectionY = (Math.random()*5-2);
      myPointDirection = 270;

      if (Math.random() > 0.5)
        rotateSpeed = (int)(Math.random()*5+1);
      else
        rotateSpeed = (int)(Math.random()*5-5);
  }
    public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;
    rotate(rotateSpeed);     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
    public void setX(int x){myCenterX = x;}
    public int getX(){return (int)myCenterX;}   
    public void setY(int y){myCenterY = y;}   
    public int getY(){return (int)myCenterY;}   
    public void setDirectionX(double x) {myDirectionX = x;}
    public double getDirectionX(){return (double)myDirectionX;}   
    public void setDirectionY(double y) {myDirectionY= y;}
    public double getDirectionY() {return (double)myDirectionY;}
    public void setPointDirection(int degrees) {myPointDirection = degrees;}   
    public double getPointDirection(){return (int)myPointDirection;}
    public void show ()  //Draws the floater at the current position  
   {             
    fill(66,81,246
       );   
    stroke(66,81,246);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  } 
}

class Stars
{
  private int myX, myY, mySize;

  Stars()
  {
    myX = (int)(Math.random()*width);
    myY = (int)(Math.random()*height);
    mySize = (int)(Math.random()*6+3);
  }
  public void show()
  {
    fill(92,209,110);
    noStroke();
    rect(myX, myY, mySize, mySize);
  }
}

class SpaceShip extends Floater  
{   
    SpaceShip()
    {
      corners = 7;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -6;
      yCorners[0] = 8;
      xCorners[1] = -4;
      yCorners[1] = 2;
      xCorners[2] = -8;
      yCorners[2] = 2;
      xCorners[3] = -8;
      yCorners[3] = -2;
      xCorners[4] = -4;
      yCorners[4] = -2;
      xCorners[5] = -6;
      yCorners[5] = -8;
      xCorners[6] = 8;
      yCorners[6] = 0;
      myColor = 255;
      myCenterX = 350;
      myCenterY = 350;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;
    }
    public void setX(int x){myCenterX = x;}
    public int getX(){return (int)myCenterX;}   
    public void setY(int y){myCenterY = y;}   
    public int getY(){return (int)myCenterY;}   
    public void setDirectionX(double x) {myDirectionX = x;}
    public double getDirectionX(){return (double)myDirectionX;}   
    public void setDirectionY(double y) {myDirectionY= y;}
    public double getDirectionY() {return (double)myDirectionY;}
    public void setPointDirection(int degrees) {myPointDirection = degrees;}   
    public double getPointDirection(){return (int)myPointDirection;} 
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

