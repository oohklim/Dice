Die oddRow;
Die evenRow;
int side = 500;

void setup()
{
  noLoop();
  size(side, side);
  stroke(0);
}

void draw()
{
  //oddRows
  for(int y = 0; y < side; y = y + side/5)
  {
    for(int x = 0; x < side; x = x + side/5)
      {
        oddRow = new Die(x, y);
        oddRow.show();
      }
  }
  //evenRows
  for(int y = side/10; y < side; y = y + side/5)
  {
    for(int x = side/10; x < side; x = x + side/5)
      {
        evenRow = new Die(x, y);
        evenRow.show();
      }
  }
}

void mousePressed()
{
  redraw();
}

class Die //models one single dice cube
{
  int value, myX, myY;
  Die(int x, int y) //constructor
  {
    myX = x;
    myY = y;
  }
  void roll()
  {
    value = (int)(Math.random()*6) + 1;
  }
  void show()
  {
    rect(myX, myY, side/10, side/10);
  }
}
