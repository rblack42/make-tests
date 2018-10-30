// Copyright 2018 Roie R. Black
#include "catch.hpp"
#include "message.h"
#include <string>

TEST_CASE("testing example message function") {
    std::string msg;
    msg = message();
    REQUIRE(msg == "Hello, World");
}
