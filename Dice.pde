Die oddRow;
Die evenRow;
//dimensions of all the die 
int dimension = 500;
int sum;
float h = 1;
float j = 5;

void setup()
{
  noLoop();
  //extra space below die for text
  size(dimension, dimension + 50);
  stroke(0);
  textSize(20);
  textAlign(CENTER);
  colorMode(HSB, 100);
}

void draw()
{
  background(h, 50, 90);
  //oddRows
  for (int y = 0; y < dimension; y = y + dimension/5)
  {
    for (int x = 0; x < dimension; x = x + dimension/5)
    {
      oddRow = new Die(x, y);
      oddRow.show();
    }
  }
  //evenRows
  for (int y = dimension/10; y < dimension; y = y + dimension/5)
  {
    for (int x = dimension/10; x < dimension; x = x + dimension/5)
    {
      evenRow = new Die(x, y);
      evenRow.show();
    }
  }
  text("Total Roll: " + sum, dimension/2, dimension + 30);
  h = h + j;
  if (h > 100 || h == 1)
  {
    j = j * -1;
  }
}

void mousePressed()
{
  sum = 0;
  redraw();
}

class Die
{
  int value, myX, myY;
  Die(int x, int y)
  {
    myX = x;
    myY = y;
    value = (int)(Math.random()*6) + 1;
    sum = sum + value;
  }
  void show()
  {
    fill(0, 0, 100);
    rect(myX, myY, dimension/10, dimension/10);
    //center of dice, diameter
    int centerX = (myX + dimension/20);
    int centerY = (myY + dimension/20);
    int d = dimension/100;
    fill(0);
    if (value == 1 || value == 3 || value == 5)
    {
      ellipse(centerX, centerY, d, d);
    }
    if (value != 1)
    {
      ellipse(centerX - dimension/40, centerY - dimension/40, d, d);
      ellipse(centerX + dimension/40, centerY + dimension/40, d, d);
    }
    if (value >= 4)
    {
      ellipse(centerX - dimension/40, centerY + dimension/40, d, d);
      ellipse(centerX + dimension/40, centerY - dimension/40, d, d);
    }
    if (value == 6)
    {
      ellipse(centerX - dimension/40, centerY, d, d);
      ellipse(centerX + dimension/40, centerY, d, d);
    }
  }
}
