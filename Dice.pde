Die oddRow;
Die evenRow;
int side = 500;
int sum;

void setup()
{
  noLoop();
  size(side, side);
  stroke(0);
}

void draw()
{
  //oddRows
  for (int y = 0; y < side; y = y + side/5)
  {
    for (int x = 0; x < side; x = x + side/5)
    {
      oddRow = new Die(x, y);
      oddRow.show();
    }
  }
  //evenRows
  for (int y = side/10; y < side - side/5; y = y + side/5)
  {
    for (int x = side/10; x < side; x = x + side/5)
    {
      evenRow = new Die(x, y);
      evenRow.show();
    }
  }
}

void mousePressed()
{
  redraw();
  sum = 0;
}

class Die //models one single dice cube
{
  int value, myX, myY;
  Die(int x, int y) //constructor
  {
    myX = x;
    myY = y;
    value = (int)(Math.random()*6) + 1;
  }
  void roll()
  {
    sum = sum + value;
  }
  void show()
  {
    fill(255);
    rect(myX, myY, side/10, side/10);
    //center of dice, diameter
    int centerX = (myX + side/20);
    int centerY = (myY + side/20);
    int d = side/100;
    fill(0);
    if (value == 1 || value == 3 || value == 5)
    {
      ellipse(centerX, centerY, d, d);
    }
    if (value != 1)
    {
      ellipse(centerX - side/40, centerY - side/40, d, d);
      ellipse(centerX + side/40, centerY + side/40, d, d);
    }
    if (value >= 4)
    {
      ellipse(centerX - side/40, centerY + side/40, d, d);
      ellipse(centerX + side/40, centerY - side/40, d, d);
    }
    if (value == 6)
    {
      ellipse(centerX - side/40, centerY, d, d);
      ellipse(centerX + side/40, centerY, d, d);
    }
  }
}

