void setup() {
  size(900, 300, P3D);
}

void draw() {
  background(0);
  camera(mouseX, mouseY, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  //ortho();
  
  // -- Draw coordinate axis -- //
  //X
  stroke(#FF0000);
  strokeWeight(4);
  line(0, 0, height/3, 0);
  //Y
  stroke(#00FF00);
  strokeWeight(4);
  line(0, 0, 0, height/3);
  
  
  //Draw the base grid
  //translate(0, 0, 0);
  stroke(255);
  strokeWeight(1);
  grid(width, height, height/14);
  
  //Draw the P
  stroke(0);
  fill(#6F8EDB);
  translate(width/2, height/2, -100);
  drawP(20, 20);
  
  //Cone
  translate(width/2, height/2, 0);
  fill(#6F8EDB);
  rotateZ(PI);
  strokeWeight(1);
  drawCylinder(1, 50, 60, 20);
  
  
  
  //stroke(255);
  //noFill();
  //box(200);
}

void grid(float sizeX, float sizeY, float sizeGrid)
{
   float x = 0;
   float y = 0;
   
   while(x <= sizeX) 
   {
     line(x, 0, x, sizeY);
     x = x + sizeGrid;
   }
   
   while(y <= sizeY) 
   {
     line(0, y, sizeX, y);
     y = y + sizeGrid;
   }
}

void drawP(float u, float depth)
{
  beginShape();
  ////Front P
  //vertex(depth, 0, 0);
  //vertex(depth, u, 0);
  //vertex(depth, u, 2*u);
  //vertex(depth, 2*u, 2*u);
  //vertex(depth, 3*u, 3*u);
  //vertex(depth, 3*u, 4*u);
  //vertex(depth, 2*u, 5*u);
  //vertex(depth, 0, 5*u);
  
  ////Back P
  //vertex(0, 0, 0);
  //vertex(0, u, 0);
  //vertex(0, u, 2*u);
  //vertex(0, 2*u, 2*u);
  //vertex(0, 3*u, 3*u);
  //vertex(0, 3*u, 4*u);
  //vertex(0, 2*u, 5*u);
  //vertex(0, 0, 5*u);
  
  //Long rectangle left
  vertex(0, 0, 0);
  vertex(depth, 0, 0);
  vertex(depth, 0, 5*u);
  vertex(0, 0, 5*u);
  
  //Rectangle down
  vertex(depth, 0, 0);
  vertex(depth, u, 0);
  vertex(0, u, 0);
  vertex(0, 0, 0);
  
  //Recangle right
  vertex(depth, u, 0);
  vertex(depth, u, 2*u);
  vertex(0, u, 2*u);
  vertex(0, u, 0);
  
  //Rectangle down shape

  endShape();
}

void drawCylinder(float topRadius, float bottomRadius, float tall, int sides) {
  float angle = 0;
  float angleIncrement = TWO_PI / sides;
  beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; ++i) {
    vertex(topRadius*cos(angle), 0, topRadius*sin(angle));
    vertex(bottomRadius*cos(angle), tall, bottomRadius*sin(angle));
    angle += angleIncrement;
  }
  endShape();
  
  // If it is not a cone, draw the circular top cap
  if (topRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);
    
    // Center point
    vertex(0, 0, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }

  // If it is not a cone, draw the circular bottom cap
  if (bottomRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);

    // Center point
    vertex(0, tall, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(bottomRadius * cos(angle), tall, bottomRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }
}
