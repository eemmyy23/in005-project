#! /bin/bash
rm -rf bin
mkdir bin
echo "Compileing cpp files"
gcc cpp/main-loop.cpp -o bin/main-loop
echo "Finished compileing"

