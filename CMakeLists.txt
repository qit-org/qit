##
#
# The MIT License (MIT)
#
# Copyright © 2018 Ruben Van Boxem
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
##

cmake_minimum_required(VERSION 3.10)

project(qit)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

find_package(Qt5 COMPONENTS Qml Quick REQUIRED)
find_package(LibGit2 REQUIRED)

set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOMOC ON)

set(sources
    src/main.c++
    src/repository.c++ src/repository.h++
    icons.qrc
    qml.qrc
   )

add_executable(qit
               ${sources}
              )
target_link_libraries(qit
                      Qt5::Qml
                      Qt5::Quick
                      LibGit2::LibGit2
                     )
