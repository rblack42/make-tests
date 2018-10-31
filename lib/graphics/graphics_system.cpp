// Copyright 2018 Roie R. Black
#include "graphics_system.h"
#include "Graphics.h"
#include <iostream>


int xPos = 50;
int yPos = 50;
int xSpeed = 2;
int ySpeed = 2;
const int RADIUS = 50;

void drawScene(void) {
    clearWindow();          // clear the last scene
    setColor(RED);
    drawFilledCircle(xPos, yPos, RADIUS);
    glutSwapBuffers();      // double buffering control
}

void animate() {
    // move your objects here
    xPos += xSpeed;
    yPos += ySpeed;
    if (xPos > WINDOW_WIDTH - RADIUS || xPos < RADIUS)
        xSpeed = -xSpeed;
    if (yPos > WINDOW_HEIGHT - RADIUS || yPos < RADIUS)
        ySpeed = -ySpeed;
    glutPostRedisplay();
    pause_ms(16);
}

// keyboard handler to terminate the program when "q" key is pressed
void handleKey(unsigned char key, int x, int y) {
    switch (key) {
        case 'q':
            exit(0);
            break;
    }
}

void show_graphics(int argc, char *argv[]) {
    std::cout
        << "Displaying graphics window"
        <<std::endl;

    graphicsSetup(argc, argv);      // initialize the graphics system
    glutDisplayFunc(drawScene);     // tell GLUT what function draws the scene
    glutIdleFunc(animate);          // Move objects when animating
    glutKeyboardFunc(handleKey);    // set up the "q" key to quit
    glutMainLoop();                 // GLUT will control the action
}

