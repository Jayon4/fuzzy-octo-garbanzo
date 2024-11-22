#!/bin/bash

# Lets create a function in bash that adds two number together
# Stretch goal can you do subtraction, multipliaction or division
# You will need to declare two variables

#!/bin/bash

# Function to perform addition
add() {
  local num1=$1
  local num2=$2
  echo "Addition: $((num1 + num2))"
}

# Function to perform subtraction
subtract() {
  local num1=$1
  local num2=$2
  echo "Subtraction: $((num1 - num2))"
}

# Function to perform multiplication
multiply() {
  local num1=$1
  local num2=$2
  echo "Multiplication: $((num1 * num2))"
}

# Function to perform division
divide() {
  local num1=$1
  local num2=$2
  if [ $num2 -ne 0 ]; then
    echo "Division: $((num1 / num2))"
  else
    echo "Error: Division by zero is not allowed."
  fi
}

# Declare two variables
num1=10
num2=5

# Call the functions
add $num1 $num2
subtract $num1 $num2
multiply $num1 $num2
divide $num1 $num2
