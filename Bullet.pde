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
