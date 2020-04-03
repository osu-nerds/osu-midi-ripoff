#include <iostream>
#include <windows.h>


int main()
{
    unsigned int devCount = midiInGetNumDevs();
    std::cout<< devCount;
    std::cout<< "\n";
    std::cin.get();
    return 0;
}

