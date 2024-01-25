// Compile using g++ -fmodule-ts -std=c++2b main.cpp mod/my_module.cpp
#include <iostream>
import my_module;

int main() { std::cout << my_function() << std::endl; }
