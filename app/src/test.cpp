//============================================================================
// Name        : test.cpp
// Author      : Cedric Schmeits
// Version     :
// Copyright   : Copyright (c) 2023
// License     : MIT
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>

#include <stdint.h>

#include "testapi_generated.h"

using namespace std;

std::ostream& operator<<(std::ostream& stream, Countries const& country);


std::ostream& operator<<(std::ostream& stream, Countries const& country)
{
    return stream << EnumNameCountries(country);
}



int main()
{
    cout << "Hello world." << endl;

    cout << Countries::Netherlands << endl;
    cout << Countries::Germany << endl;
    cout << Countries::England << endl;
    cout << Countries::Finland << endl;

    return 0;
}
