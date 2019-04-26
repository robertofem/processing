//----------CONSTANTS----------//

//Color blue red
//ambientLight(51, 102, 126);
//ambientLight(102, 50, 126);
//color COLOR_LETTERS = color(254,0,0);
//color COLOR_OBJECTS = #6F8EDB;

//Letras verdes, objetos amarillos bola roja
//color(50,238,130)
//#ede482
//#dd636b

//Letras naranjas, objetos azules, fondo blanco
//color(248,148,40)
//#64d6dd

//Letras azul marino, objetos rosas 
//color(4,237,146)
//ec46a0

///FINAL COLORS
// vaporwave azul y rosita
//(ambientLight(72, 101, 125);
// ambientLight(138, 71, 16);
//color(13,220,233)

//vaporwave lila (con y sin objetos)
//ambientLight(51, 102, 126);
//ambientLight(102, 50, 126);
//color(229,145,226)
//#90e7cb

//green leters objects red
//ambientLight(51, 102, 126);
//ambientLight(102, 50, 126);
//color(44,243,24)
//#f91526

//Letras verdes cil amarillo esfera rojo
//ambientLight(51, 102, 126);
//ambientLight(102, 50, 126);
//color(50,238,130)
//#d4d373
//#d4656d

//Letras naranjas, objetos azules, fondo blanco
//ambientLight(51, 102, 126);
//ambientLight(102, 50, 126);
//color(248,148,40)
//#64d6dd

//Letras azul marino, objetos rosas 
//ambientLight(51, 102, 126);
//ambientLight(102, 50, 126);
//color(4,237,146)
//ec46a0

//----------VARIABLES----------//
int bufferSize = 1256;
int bufferWritePosition = 0;
String[] buffer = new String[bufferSize];

void setup() {
  size(1280, 342, P3D);
  //noSmooth();
}

void draw() {
  background(7);
  //camera(mouseX, mouseY, (height/1.5) / tan(PI/4), width/2, height/2, 0, 0, 1, 0);
  camera(width/5, width/2.30, width/3.5, width/2, height/2, 0, 0, 0, -1);
  //lights();
  ambientLight(51, 102, 126);
  ambientLight(102, 50, 126);
  lightSpecular(204, 204, 204);
  //directionalLight(102, 102, 102, 2, 1, -1);
  directionalLight(102, 102, 102, -2, -2, -1);
  lightSpecular(102, 102, 102);
  specular(51, 51, 51);
  ortho();
  
  float GRID_SIZE = height/7;
  
  //Draw elements //<>// //<>// //<>//
  //Draw_axis(GRID_SIZE);
  Draw_grid(GRID_SIZE);
  Draw_letters(GRID_SIZE/2);
  //Draw_cylinder(GRID_SIZE); //<>// //<>// //<>//
  Draw_sphere(GRID_SIZE);
   //<>// //<>// //<>//
  //save to file
  save("pnk_grid_letters.png"); //<>// //<>// //<>//
}
 //<>// //<>// //<>//
void Draw_axis(float grid_size){
  pushMatrix(); //<>// //<>// //<>//
  translate(3*grid_size, -2*grid_size, 1);
  //X //<>// //<>// //<>//
  stroke(#FF0000); //<>// //<>// //<>//
  strokeWeight(4); //<>// //<>// //<>// //<>//
  line(0, 0, 0, height/3, 0, 0);
  //Y //<>// //<>// //<>//
  stroke(#00FF00);
  strokeWeight(4); //<>// //<>// //<>//
  line(0, 0, 0, 0, height/3, 0); //<>// //<>// //<>//
  //Z //<>// //<>// //<>//
  stroke(#0000FF); //<>// //<>// //<>// //<>//
  strokeWeight(4); //<>// //<>// //<>//
  line(0, 0, 0, 0, 0, height/3);
  popMatrix();
} //<>// //<>// //<>// //<>// //<>// //<>// //<>//
 //<>// //<>// //<>//
void Draw_grid(float grid_size){
  pushMatrix(); //<>// //<>// //<>//
  translate(-2*grid_size, -8*grid_size, 0); //<>// //<>// //<>// //<>// //<>// //<>//
  stroke(244);
  strokeWeight(1.8);
  grid(width*2, height*4, grid_size);
  popMatrix(); //<>// //<>// //<>// //<>//
} //<>// //<>// //<>// //<>//

void grid(float sizeX, float sizeY, float sizeGrid) //<>// //<>// //<>// //<>//
{ //<>// //<>// //<>// //<>//
   float x = 0; //<>// //<>// //<>// //<>//
   float y = 0; //<>// //<>// //<>// //<>//
    //<>// //<>// //<>// //<>//
   while(x <= sizeX)  //<>// //<>// //<>// //<>//
   { //<>// //<>// //<>// //<>// //<>//
     line(x, 0, x, sizeY); //<>// //<>// //<>// //<>//
     x = x + sizeGrid;
   }
    //<>// //<>// //<>//
   while(y <= sizeY) 
   {
     line(0, y, sizeX, y); //<>// //<>// //<>// //<>//
     y = y + sizeGrid; //<>// //<>// //<>// //<>// //<>// //<>//
   }
} //<>// //<>// //<>// //<>//

void Draw_letters(float box_width)
{
    fill(color(244,19,19));
    //stroke(color(25,25,0));   //<>// //<>// //<>//
    noStroke(); //<>// //<>// //<>//
    pushMatrix();
    translate(-2*box_width, -20*box_width, 0); //<>// //<>// //<>// //<>//
    rotateX(radians(-90));
    
    float box_sep = box_width;
    float letter_sep = box_width * 16;
    float letter_spacing = box_width * 6; 
    translate(box_width/2, box_width/2, 0);//adjust the Wordpaint error
    WordPaint("S", box_width, box_sep, letter_sep, letter_spacing);
    translate(3*2*box_width, 0, 2*2*box_width);
    WordPaint("E", box_width, box_sep, letter_sep, letter_spacing);
    translate(3.1*2*box_width, 0, 2*2*box_width);
    WordPaint("R", box_width, box_sep, letter_sep, letter_spacing);
     translate(3*2*box_width, 0, 2*2*box_width);
    WordPaint("L", box_width, box_sep, letter_sep, letter_spacing);
     translate(3*2*box_width, 0, 2*2*box_width);
    WordPaint("L", box_width, box_sep, letter_sep, letter_spacing);
     translate(3*2*box_width, 0, 2*2*box_width);
    WordPaint("A", box_width, box_sep, letter_sep, letter_spacing);
    popMatrix();
}

void WordPaint(String InputWordOfFunction, float BoxWidth, float BoxSep, float LetterSep, float LetterSpacing) { 
  for (int i = 0; i < InputWordOfFunction.length(); i = i+1) {
    buffer = new String[bufferSize];
    bufferWritePosition=0;
    keyPaintHelper(InputWordOfFunction.charAt(i));
    for (int  j = 0; j < bufferWritePosition; j = j+1) {
      for (int  k = 0; k < buffer[j].length(); k = k+1) {
        if (buffer[j].charAt(k) == '*') {
          pushMatrix();
          translate((j*BoxSep)+(i*LetterSep)+LetterSpacing, 
          -(k*BoxSep), 
          -1); 
          // rotateY(0.3); //  ;-) 
          box (BoxWidth,BoxWidth,BoxWidth*40);
          popMatrix();
        }
      }
    }
  }
}


void Draw_cylinder(float grid_size){
  //Cilynder 1
  //pushMatrix();
  //translate(grid_size*5, -2*grid_size, 0);
  //rotateX(radians(+90));
  //fill(#6F8EDB);
  //rotateX(PI/2);
  //rotateZ(PI/2);
  //strokeWeight(1);
  //drawCylinder(grid_size*0.8, grid_size*0.8, grid_size*3.5, 20);
  //popMatrix();
  
  
  //Cilynder 2
  pushMatrix();
  translate(grid_size*7.5, grid_size*4.5, grid_size*3.5);
  rotateX(radians(+90));
  fill(#64d6dd);
  rotateZ(PI);
  strokeWeight(1);
  drawCylinder(grid_size*0.8, grid_size*0.8, grid_size*3.5, 20);
  popMatrix();
  
  //Cone
  pushMatrix();
  translate(grid_size*16.5, grid_size*12.5, grid_size*3.5);
  rotateX(radians(+90));
  //fill(#6F8EDB);
  rotateZ(PI);
  strokeWeight(1);
  drawCylinder(1, grid_size, grid_size*3.5, 20);
  popMatrix();
  
  //Cilynder3
  pushMatrix();
  translate(grid_size*22, grid_size*9.5, grid_size*1.7);
  rotateX(radians(+90));
  //fill(#6F8EDB);
  rotateZ(PI);
  strokeWeight(1);
  drawCylinder(1.2*grid_size, 1.2*grid_size, grid_size*1.7, 20);
  popMatrix();
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

void Draw_sphere(float grid_size){
  //Cone
  pushMatrix();
  translate(grid_size*20.5, grid_size*12,1.3*grid_size);
  fill(#f7e40d);
  strokeWeight(1);
  sphere(1.6*grid_size);
  popMatrix();
}

void keyPaintHelper(char InputKeyOfFunction) {
  char k = Character.toUpperCase(InputKeyOfFunction);
  int letterSpacing=0;
  switch(k) {
  case 'A':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " ******  ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = "   *   * ";
      buffer[bufferWritePosition + 3] = "   *   * ";
      buffer[bufferWritePosition + 4] = " ******* ";
      buffer[bufferWritePosition + 5] = " ******  ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'B':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " ******* ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = " *  *  * ";
      buffer[bufferWritePosition + 3] = " *  *  * ";
      buffer[bufferWritePosition + 4] = " ******* ";
      buffer[bufferWritePosition + 5] = "  ** **  ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'C':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = "  *****  ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = " *     * ";
      buffer[bufferWritePosition + 3] = " *     * ";
      buffer[bufferWritePosition + 4] = " *     * ";
      buffer[bufferWritePosition + 5] = "  *   *  ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'D':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " ******* ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = " *     * ";
      buffer[bufferWritePosition + 3] = " **   ** ";
      buffer[bufferWritePosition + 4] = "  *****  ";
      buffer[bufferWritePosition + 5] = "   ***   ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'E':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " ******* ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = " *  *  * ";
      buffer[bufferWritePosition + 3] = " *  *  * ";
      buffer[bufferWritePosition + 4] = " *  *  * ";
      buffer[bufferWritePosition + 5] = " *     * ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'F':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " ******* ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = "    *  * ";
      buffer[bufferWritePosition + 3] = "    *  * ";
      buffer[bufferWritePosition + 4] = "    *  * ";
      buffer[bufferWritePosition + 5] = "       * ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'G':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = "  *****  ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = " ** *  * ";
      buffer[bufferWritePosition + 3] = " ** *  * ";
      buffer[bufferWritePosition + 4] = " **** ** ";
      buffer[bufferWritePosition + 5] = " **** *  ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'H':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " ******* ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = "    *    ";
      buffer[bufferWritePosition + 3] = "    *    ";
      buffer[bufferWritePosition + 4] = " ******* ";
      buffer[bufferWritePosition + 5] = " ******* ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'I':
    if (thereAreEnoughSlots(6)) {
      buffer[bufferWritePosition + 0] = "         ";
      buffer[bufferWritePosition + 1] = " *     * ";
      buffer[bufferWritePosition + 2] = " ******* ";
      buffer[bufferWritePosition + 3] = " ******* ";
      buffer[bufferWritePosition + 4] = " *     * ";
      buffer[bufferWritePosition + 5] = "         ";
      bufferWritePosition += 6;
    }
    break;
  case 'J':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = "  **     ";
      buffer[bufferWritePosition + 1] = " ***     ";
      buffer[bufferWritePosition + 2] = " *     * ";
      buffer[bufferWritePosition + 3] = " ******* ";
      buffer[bufferWritePosition + 4] = "  ****** ";
      buffer[bufferWritePosition + 5] = "       * ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'K':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " ******* ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = "   ***   ";
      buffer[bufferWritePosition + 3] = "  ** **  ";
      buffer[bufferWritePosition + 4] = " **   ** ";
      buffer[bufferWritePosition + 5] = " *     * ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'L':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " ******* ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = " *       ";
      buffer[bufferWritePosition + 3] = " *       ";
      buffer[bufferWritePosition + 4] = " *       ";
      buffer[bufferWritePosition + 5] = " *       ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'M':
    if (thereAreEnoughSlots(9)) {
      buffer[bufferWritePosition + 0] = " ******  ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = "    **** ";
      buffer[bufferWritePosition + 3] = "  ****   ";
      buffer[bufferWritePosition + 4] = "  ****   ";
      buffer[bufferWritePosition + 5] = "    **** ";
      buffer[bufferWritePosition + 6] = " ******* ";
      buffer[bufferWritePosition + 7] = " ******  ";
      buffer[bufferWritePosition + 8] = "         ";
      bufferWritePosition += 9;
    }
    break;
  case 'N':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " ******* ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = "    **   ";
      buffer[bufferWritePosition + 3] = "   **    ";
      buffer[bufferWritePosition + 4] = " ******* ";
      buffer[bufferWritePosition + 5] = " ******* ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'O':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = "  *****  ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = " *     * ";
      buffer[bufferWritePosition + 3] = " *     * ";
      buffer[bufferWritePosition + 4] = " ******* ";
      buffer[bufferWritePosition + 5] = "  *****  ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'P':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " ******* ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = "    *  * ";
      buffer[bufferWritePosition + 3] = "    *  * ";
      buffer[bufferWritePosition + 4] = "    **** ";
      buffer[bufferWritePosition + 5] = "     **  ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'Q':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = "  *****  ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = " **    * ";
      buffer[bufferWritePosition + 3] = " **    * ";
      buffer[bufferWritePosition + 4] = "******** ";
      buffer[bufferWritePosition + 5] = "* *****  ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'R':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " ******* ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = "   **  * ";
      buffer[bufferWritePosition + 3] = "  ***  * ";
      buffer[bufferWritePosition + 4] = " ** **** ";
      buffer[bufferWritePosition + 5] = " *   **  ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'S':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = "  ** **  ";
      buffer[bufferWritePosition + 1] = " ** **** ";
      buffer[bufferWritePosition + 2] = " *  *  * ";
      buffer[bufferWritePosition + 3] = " *  *  * ";
      buffer[bufferWritePosition + 4] = " **** ** ";
      buffer[bufferWritePosition + 5] = "  ** **  ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'T':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = "       * ";
      buffer[bufferWritePosition + 1] = "       * ";
      buffer[bufferWritePosition + 2] = " ******* ";
      buffer[bufferWritePosition + 3] = " ******* ";
      buffer[bufferWritePosition + 4] = "       * ";
      buffer[bufferWritePosition + 5] = "       * ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'U':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = "  ****** ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = " *       ";
      buffer[bufferWritePosition + 3] = " *       ";
      buffer[bufferWritePosition + 4] = " ******* ";
      buffer[bufferWritePosition + 5] = "  ****** ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'V':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = "   ***** ";
      buffer[bufferWritePosition + 1] = "  ****** ";
      buffer[bufferWritePosition + 2] = " **      ";
      buffer[bufferWritePosition + 3] = " **      ";
      buffer[bufferWritePosition + 4] = "  ****** ";
      buffer[bufferWritePosition + 5] = "   ***** ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'W':
    letterSpacing=-6 ; // -6 for 'W'
    if (thereAreEnoughSlots(9)) {
      buffer[bufferWritePosition + 0] = "  ****** ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = " **      ";
      buffer[bufferWritePosition + 3] = "  ****   ";
      buffer[bufferWritePosition + 4] = "  ****   ";
      buffer[bufferWritePosition + 5] = " **      ";
      buffer[bufferWritePosition + 6] = " ******* ";
      buffer[bufferWritePosition + 7] = "  ****** ";
      buffer[bufferWritePosition + 8] = "         ";
      bufferWritePosition += 9;
    }
    break;
  case 'X':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " **   ** ";
      buffer[bufferWritePosition + 1] = " *** *** ";
      buffer[bufferWritePosition + 2] = "   ***   ";
      buffer[bufferWritePosition + 3] = "   ***   ";
      buffer[bufferWritePosition + 4] = " *** *** ";
      buffer[bufferWritePosition + 5] = " **   ** ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'Y':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = "     *** ";
      buffer[bufferWritePosition + 1] = "    **** ";
      buffer[bufferWritePosition + 2] = " ****    ";
      buffer[bufferWritePosition + 3] = " ****    ";
      buffer[bufferWritePosition + 4] = "    **** ";
      buffer[bufferWritePosition + 5] = "     *** ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'Z':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " **    * ";
      buffer[bufferWritePosition + 1] = " ***   * ";
      buffer[bufferWritePosition + 2] = " * **  * ";
      buffer[bufferWritePosition + 3] = " *  ** * ";
      buffer[bufferWritePosition + 4] = " *   *** ";
      buffer[bufferWritePosition + 5] = " *    ** ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case '.':
    if (thereAreEnoughSlots(3)) {
      buffer[bufferWritePosition + 0] = " **      ";
      buffer[bufferWritePosition + 1] = " **      ";
      buffer[bufferWritePosition + 2] = "         ";
      bufferWritePosition += 3;
    }
    break;
  case ',':
    if (thereAreEnoughSlots(4)) {
      buffer[bufferWritePosition + 0] = "*        ";
      buffer[bufferWritePosition + 1] = "***      ";
      buffer[bufferWritePosition + 2] = " **      ";
      buffer[bufferWritePosition + 3] = "         ";
      bufferWritePosition += 4;
    }
    break;
  case '\'':
    if (thereAreEnoughSlots(3)) {
      buffer[bufferWritePosition + 0] = "     *** ";
      buffer[bufferWritePosition + 1] = "     *** ";
      buffer[bufferWritePosition + 2] = "         ";
      bufferWritePosition += 3;
    }
    break;
  case '?':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = "      *  ";
      buffer[bufferWritePosition + 1] = "      ** ";
      buffer[bufferWritePosition + 2] = " * *   * ";
      buffer[bufferWritePosition + 3] = " * **  * ";
      buffer[bufferWritePosition + 4] = "    **** ";
      buffer[bufferWritePosition + 5] = "     **  ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case '!':
    if (thereAreEnoughSlots(4)) {
      buffer[bufferWritePosition + 0] = "         ";
      buffer[bufferWritePosition + 1] = " * ***** ";
      buffer[bufferWritePosition + 2] = " * ***** ";
      buffer[bufferWritePosition + 3] = "         ";
      bufferWritePosition += 4;
    }
    break;
  case '-':
    if (thereAreEnoughSlots(4)) {
      buffer[bufferWritePosition + 0] = "   **    ";
      buffer[bufferWritePosition + 1] = "   **    ";
      buffer[bufferWritePosition + 2] = "   **    ";
      buffer[bufferWritePosition + 3] = "         ";
      bufferWritePosition += 4;
    }
    break;
  case ' ':
    if (thereAreEnoughSlots(4)) {
      buffer[bufferWritePosition + 0] = "         ";
      buffer[bufferWritePosition + 1] = "         ";
      buffer[bufferWritePosition + 2] = "         ";
      buffer[bufferWritePosition + 3] = "         ";
      bufferWritePosition += 4;
    }
    break;
  default:
  }
}

boolean thereAreEnoughSlots(int slotsRequired) {
  /*
  if((bufferSize - bufferWritePosition) <= slotsRequired + 4) {
   return false;
   }
   else return true;
   */
  return true;
}
