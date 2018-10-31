// Copyright 2018 Roie R. Black

#include <iostream>
#include "message.h"
#include "graphics_system.h"

int main(int argc, char *argv[]) {
    char key;
    std::cout << message() << std::endl;
    std::cout << "Press 'g' to see graphics" << std::endl;
    std::cin >> key;
    if (key == 'g') {
        std::cout
            << "\tPress 'q' key to quit display"
            << std::endl;
        show_graphics(argc, argv);
    }
    std::cout
        << "Program terminated normally"
        <<std::endl;
    return 0;
}
