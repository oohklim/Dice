Die oddRow;
Die evenRow;
//dimensions of all the die 
int dimension = 800;
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
  for (int y = 0; y < dimension; y = y + dimension/16)
  {
    for (int x = 0; x < dimension; x = x + dimension/16)
    {
      oddRow = new Die(x, y);
      oddRow.show();
    }
  }
  //evenRows
  for (int y = dimension/32; y < dimension; y = y + dimension/16)
  {
    for (int x = dimension/32; x < dimension; x = x + dimension/16)
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
    rect(myX, myY, dimension/32, dimension/32);
    //center of dice, diameter
    int centerX = (myX + dimension/64);
    int centerY = (myY + dimension/64);
    int d = dimension/320;
    fill(0);
    if (value == 1 || value == 3 || value == 5)
    {
      ellipse(centerX, centerY, d, d);
    }
    if (value != 1)
    {
      ellipse(centerX - dimension/128, centerY - dimension/128, d, d);
      ellipse(centerX + dimension/128, centerY + dimension/128, d, d);
    }
    if (value >= 4)
    {
      ellipse(centerX - dimension/128, centerY + dimension/128, d, d);
      ellipse(centerX + dimension/128, centerY - dimension/128, d, d);
    }
    if (value == 6)
    {
      ellipse(centerX - dimension/128, centerY, d, d);
      ellipse(centerX + dimension/128, centerY, d, d);
    }
  }
}
