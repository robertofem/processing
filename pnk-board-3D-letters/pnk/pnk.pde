
//----------CONSTANTS----------//

//----------VARIABLES----------//
int bufferSize = 1256;
int bufferWritePosition = 0;
String[] buffer = new String[bufferSize];

void setup() {
  size(1800, 600, P3D);
  //noSmooth();
}

void draw() {
  background(0);
  //camera(mouseX, mouseY, (height/1.5) / tan(PI/4), width/2, height/2, 0, 0, 1, 0);
  camera(700, 600, 300, width/2, height/2, 0, 0, 0, -1);
  //lights();
  ambientLight(51, 102, 126);
  ambientLight(102, 50, 126);
  lightSpecular(204, 204, 204);
  directionalLight(102, 102, 102, 0, 1, -1);
  lightSpecular(102, 102, 102);
  translate(20, 50, 0);
  specular(51, 51, 51);
  ortho();
  
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
  float GRID_SIZE = height/20;
  stroke(255);
  strokeWeight(1);
  grid(width, height, GRID_SIZE);
  
  //Draw PNK letters
  fill(color(254,0,0));
  //stroke(color(25,25,0));  
  noStroke();
  Draw_letters(GRID_SIZE);

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

void Draw_letters(float box_width)
{
    pushMatrix();
    //translate(100,-250, 0); //<>//
    translate(15*box_width, 4*box_width, 0);
    rotateX(radians(-90));
    
    float box_sep = box_width;
    float letter_sep = box_width * 8;
    float letter_spacing = 0; 
    WordPaint("PNK", box_width, box_sep, letter_sep, letter_spacing);
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
          box (BoxWidth,BoxWidth,BoxWidth*20);
          popMatrix();
        }
      }
    }
  }
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
